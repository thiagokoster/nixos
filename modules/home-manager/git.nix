{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    extraConfig = {
      user.name = "thiagokoster";
      user.email = "thiagokoster@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
