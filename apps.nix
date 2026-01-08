{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # --- System & Terminal ---
    hyprshade
    fastfetch
    kitty
    # alacritty
    zsh
    # git
    wget
    xfce.thunar
    yazi
    kdePackages.ark
    bibata-cursors
    btop
    cava
    cbonsai
    cmatrix

    # --- Editors & IDEs ---
    vim
    neovim
    vscode
    code-cursor
    zed
    kdePackages.kate
    arduino-ide

    # --- Development Runtimes ---
    nodejs_24
    # Java Versions (Using lowPrio to prevent jexec collisions)
    openjdk21                  # Primary version
    (lib.lowPrio openjdk17)    # Secondary
    (lib.lowPrio openjdk8)     # Legacy
    texliveTeTeX
    openssh
    mysql-workbench
    mysql84
    

    # --- Communication & Social ---
    discord
    vesktop
    # spotify
    anytype
    joplin-desktop
    steam

    # Life
    libreoffice
    kdePackages.okular
    audacity
    kdePackages.dolphin
    qimgv
    # multiviewer-for-f1

    #Desktop only
    # pavucontrol
    # openrgb-with-all-plugins
    # filezilla
    # heroic
    # hydralauncher
    # lutris
    # protonplus
    # qbittorrent
    nicotine-plus
  ];
}