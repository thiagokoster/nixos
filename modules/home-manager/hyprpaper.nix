{config, inputs, ...}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      wallpaper = {
        monitor = "";
        path = "${inputs.self}/wallpapers/saturn.png";
      };
    };
  };
}
