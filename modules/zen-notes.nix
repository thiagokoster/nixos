{ pkgs, ... }:

{
  home.packages = [
    (pkgs.appimageTools.wrapType2 {
      pname = "zennotes";
      version = "2.3.0";
      src = pkgs.fetchurl {
        url = "https://github.com/ZenNotes/zennotes/releases/download/v2.3.0/ZenNotes-2.3.0-linux-x86_64.AppImage";
        hash = "sha256-IvFGK7n3KQVGETmt6hQUy+bZNTOCkfuwH8ifl4KTxxw=";
      };
    })
  ];
}
