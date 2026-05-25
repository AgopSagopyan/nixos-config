{ pkgs, ... }:

{
  config.vim = {

    startPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "matrix.nvim";
        version = "1.0";
        src = pkgs.fetchFromGitHub {
          owner = "iruzo";
          repo = "matrix-nvim";
          rev = "master";
          hash = "sha256-h1+RwuUJPhpYxHS2VUS7dcqc7lDIpQ9m4uKUVCIjRLM=";
        };
      })
    ];

    luaConfigRC.matrix-theme = ''
      --vim.cmd.colorscheme("matrix")

      print("Hello from Dassam")
    '';

    theme.enable = true;
    theme.name = "catppuccin";
    theme.style = "mocha";

    options = {
      expandtab = true;
      tabstop = 4;
      shiftwidth = 4;
      softtabstop = 4;
    };

    languages.nix.enable = true;
    languages.python.enable = true;

    # You can add custom keymaps, plugins, etc. here
    keymaps = [
      {
        key = "<leader>w";
        action = "<cmd>w<cr>";
        mode = "n";
      }
      {
        key = "<leader>e";
        action = "<cmd>Ex<cr>";
        mode = "n";
      }

    ];
  };
}
