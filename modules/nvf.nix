{ inputs, pkgs, lib, ... }:
{
  imports = [ inputs.nvf.homeManagerModules.default ];
  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        vimAlias = true;
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
        options = {
          tabstop = 4;
          softtabstop = 4;
          shiftwidth = 4;
          autoindent = true;
          smartindent = true;
          expandtab = true;
        };

        clipboard = {
          enable = true;
          providers = {
            wl-copy.enable = true;
          };
        };

        telescope = {
          enable = true;
        };

        filetree.neo-tree = {
          enable = true;
        };

        autocomplete.blink-cmp.enable = true;
        lsp.enable = true;
        lsp.presets.clangd.enable = true;
        lsp.servers.clangd.cmd = lib.mkForce [
          "${pkgs.clang-tools}/bin/clangd"
          "--query-driver=**/riscv32-esp-elf-*"
        ];
        treesitter = {
          enable = true;
          indent.enable = false;
        };

        languages = {
          nix.enable = true;
          zig.enable = true;
          go.enable = true;
        };

        maps.normal."<leader>e" = {
          action = "<cmd>Neotree toggle<CR>";
          desc = "Toggle Neotree";
        };
      };
    };
  };

}
