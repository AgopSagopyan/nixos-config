{ pkgs, ... }:
{
  config.vim = {

    luaConfigRC."config-name" = ''
      print("Hello From NVF")

      vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
      vim.api.nvim_set_hl(0, "Cursor", { fg = "#000000", bg = "#FFFFFF" })
    '';

    globals.mapleader = " ";

    theme.enable = true;
    theme.name = "gruvbox";
    theme.style = "dark";

    lsp.formatOnSave = true;

    options = {
      expandtab = true;
      tabstop = 2;
      shiftwidth = 2;
      softtabstop = 2;

      number = true;
      relativenumber = false;

      cursorline = true;
      cursorcolumn = true;
    };

    keymaps = [
      {
        key = "<leader>us";
        mode = "n";
        action = ":UnitySync<CR>";
        desc = "Sync Unity Project Files";
      }
      {
        key = "<leader>e";
        mode = "n";
        action = ":Ex<CR>";
        silent = true;
        desc = "Open file explorer";
      }
    ];

    autocomplete.nvim-cmp.enable = true;
    telescope.enable = true;
    autopairs.nvim-autopairs.enable = true;

    extraPlugins = {
      /*
        nvim-unity = {
          package = pkgs.vimUtils.buildVimPlugin {
            name = "nvim-unity";
            src = pkgs.fetchFromGitHub {
              # !!! CRITICAL: Fix these values. "apyra/nvim-unity" returned a 404 error !!!
              owner = "apyra";
              repo = "nvim-unity-sync";
              rev = "main";
              # After fixing the repository paths above, you will get a hash mismatch error.
              # Run the build once, copy the correct sha256 string from the error, and paste it below.
              sha256 = "sha256-keRm3qvvyLi3otKwKoPF8XULoDehYt3SGIzgUP+vhrk=";
            };
          };
          setup = ''
            require('nvim-unity').setup({
              -- Your configuration here
            })
          '';
        };
      */
    };

    lsp = {
      enable = true;
    };

    languages = {
      enableTreesitter = true;

      nix = {
        enable = true;
        format.enable = true;
        # FIXED: Changed from a single string to a list to resolve the evaluation warning
        format.type = [ "nixfmt" ];
      };

      kotlin = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "kotlin-language-server" ];
        treesitter.enable = true;
      };

      csharp = {
        enable = true;
        lsp.enable = true;
        lsp.servers = [ "omnisharp" ];
      };
    };

  };
}
