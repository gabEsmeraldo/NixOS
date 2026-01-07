{ config, pkgs, inputs, ...}:

{
  imports = [
    ./zsh.nix
    ./apps.nix
    ./modules/matugen.nix
    ./modules/spicetify.nix
  ];
  home.username = "gabzu";
  home.homeDirectory = "/home/gabzu";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
  programs.kitty = {
    enable = true;
    settings = {
      shell = "zsh";
    };
  };
  programs.bash = {
    enable = false;
    shellAliases = {
      btw = "echo hyprland btw";
    };
    profileExtra = ''
      if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
        exec hyprland
      fi
    '';
  };
  home.file.".config/hypr".source = ./config/hypr;
  home.file.".config/fastfetch".source = ./config/fastfetch;
  xdg.configFile."kitty/kitty.conf".source = ./config/kitty/kitty.conf;
}