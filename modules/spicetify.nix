{ inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
in
{
  imports = [ inputs.spicetify-nix.homeManagerModules.default ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.comfy;
    
    # Use um esquema padrão que já existe no Comfy para o build passar
    colorScheme = "Spotify"; 

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
    ];

    enabledCustomApps = [
      spicePkgs.apps.marketplace
      spicePkgs.apps."lyricsPlus"
    ];
  };
}