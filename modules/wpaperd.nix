{ pkgs, config, ... }:
{
  services.wpaperd = {
    enable = true;
    settings = {
      any = {
        path = "~/.nixos/wallpapers/0012.png";
      };
    };
  };
}
