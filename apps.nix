{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- System & Terminal ---
    fastfetch
    kitty
    zsh
    git
    wget
    xfce.thunar

    # --- Editors & IDEs ---
    vim
    neovim
    vscode
    zed
    kdePackages.kate
    arduino-ide

    # --- Development Runtimes ---
    nodejs_24
    # Java Versions (Using lowPrio to prevent jexec collisions)
    openjdk21                  # Primary version
    (lib.lowPrio openjdk17)    # Secondary
    (lib.lowPrio openjdk8)     # Legacy

    # --- Communication & Social ---
    discord
    vesktop
    spotify
    anytype
  ];
}