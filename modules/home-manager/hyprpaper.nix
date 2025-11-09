{config, inputs, ...}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${inputs.self}/wallpapers/saturn.png" ];
      wallpaper = [ ", ${inputs.self}/wallpapers/saturn.png" ];
    };
  };
}
