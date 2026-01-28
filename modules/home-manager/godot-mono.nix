{ pkgs, ... }:

let
  godotMono46 = pkgs.stdenvNoCC.mkDerivation {
    pname = "godot-mono";
    version = "4.6-stable";

    src = pkgs.fetchzip {
      url = "https://github.com/godotengine/godot/releases/download/4.6-stable/Godot_v4.6-stable_mono_linux_x86_64.zip";
      sha256 = "sha256-so6rIo4QGi9HVDIh5kT97UFGEw8DphnfIvRKKtumzlI=";
      stripRoot = false;
    };

    dontBuild = true;
    dontConfigure = true;

    installPhase = ''
      runHook preInstall

      mkdir -p "$out/bin" "$out/opt/godot-mono"
      cp -r . "$out/opt/godot-mono/"

      # The release zip contains a single top-level directory.
      rootDir="$out/opt/godot-mono/Godot_v4.6-stable_mono_linux_x86_64"

      if [ -f "$rootDir/Godot_v4.6-stable_mono_linux.x86_64" ]; then
        chmod +x "$rootDir/Godot_v4.6-stable_mono_linux.x86_64"
        ln -s "$rootDir/Godot_v4.6-stable_mono_linux.x86_64" "$out/bin/godot-mono"
      elif [ -f "$rootDir/Godot_v4.6-stable_mono_linux_x86_64" ]; then
        chmod +x "$rootDir/Godot_v4.6-stable_mono_linux_x86_64"
        ln -s "$rootDir/Godot_v4.6-stable_mono_linux_x86_64" "$out/bin/godot-mono"
      else
        echo "Could not find Godot mono binary in extracted zip" >&2
        echo "Contents:" >&2
        ls -la "$out/opt/godot-mono" >&2
        ls -la "$rootDir" >&2 || true
        exit 1
      fi

      runHook postInstall
    '';

    meta = with pkgs.lib; {
      description = "Godot Engine 4.6 (Mono build)";
      homepage = "https://godotengine.org/";
      license = licenses.mit;
      platforms = [ "x86_64-linux" ];
      mainProgram = "godot-mono";
    };
  };

in
{
  home.packages = [ godotMono46 ];
}
