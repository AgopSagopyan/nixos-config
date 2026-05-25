{
  description = "A very basic flake";

  inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    tuxedo-nixos.url = "github:sund3RRR/tuxedo-nixos";
    nvf.url = "github:notashelf/nvf";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      tuxedo-nixos,
      home-manager,
      nvf,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};

      # 1. Define your custom Neovim package here
      my-neovim =
        (nvf.lib.neovimConfiguration {
          inherit pkgs;
          modules = [
            ./modules/nvf/newneovim.nix
          ];
        }).neovim;
    in
    {
      # Standalone Home Manager Build
      homeConfigurations."keremcem" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        extraSpecialArgs = { inherit inputs; };

        modules = [
          {
            home.username = "keremcem";
            home.homeDirectory = "/home/keremcem";
          }
          ./modules/home-manager/home.nix
        ];
      };

      # 2. Make the package available via 'nix build .#my-neovim'
      packages.${system}.my-neovim = my-neovim;

      nixosConfigurations."keremcem" = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
          ./modules/nixos/configuration.nix
          tuxedo-nixos.nixosModules.default
          home-manager.nixosModules.default

          {
            # 3. Add the custom Neovim to your system packages
            environment.systemPackages = [
              self.packages.${system}.my-neovim
            ];

            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              backupFileExtension = "backup";
              extraSpecialArgs = { inherit inputs; };
              users."keremcem" = import ./modules/home-manager/home.nix;
            };
          }
        ];
      };
    };
}
