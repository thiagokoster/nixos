{config, pkgs, ...}:
{
  programs.git = {
    enable = true;
    settings = {
      user.name = "thiagokoster";
      user.email = "thiagokoster@gmail.com";
      init.defaultBranch = "main";
    };
  };
}
