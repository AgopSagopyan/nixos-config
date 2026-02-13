{
  description = "A very basic flake";

  inputs = {
    nix-flatpak.url = "github:gmodena/nix-flatpak";
  };

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  
  inputs.tuxedo-nixos.url = "github:sund3RRR/tuxedo-nixos";

  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };







  outputs = { self, nixpkgs, tuxedo-nixos, home-manager, nix-flatpak, ... }@inputs: {

    nixosConfigurations."keremcem" = nixpkgs.lib.nixosSystem {

      system = "x86_64-linux";
      

      
      modules = 
      [ 
        ./modules/configuration.nix
        
	home-manager.nixosModules.default {
          home-manager = {

            useGlobalPkgs = true;
	    useUserPackages = true;
	    users."keremcem" = ./modules/home.nix;
      extraSpecialArgs = { inherit nix-flatpak; };
	  };
	}

	tuxedo-nixos.nixosModules.default

      ];

      
    };


  };
}
