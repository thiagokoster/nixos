{inputs, ...}:
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
                    shiftwidth = 4;
                };

                telescope = {
                    enable = true;
                };

                autocomplete.blink-cmp.enable = true;
                languages = {
                    enableLSP = true;
                    enableTreesitter = true;

                    nix.enable = true;
                    zig.enable = true;
                };
            };
        };
    };

}
