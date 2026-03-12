{
  pkgs,
  githubUsername,
  githubEmail,
  ...
} :
{
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    blueman
    direnv
    discord
    docker
    ffmpeg
    file-roller
    fish
    font-awesome
    gammastep
    gh
    git
    github-desktop
    gvfs
    hyprland
    hyprpaper
    hyprpolkitagent
    hyprshot
    imagemagick
    neovim
    networkmanagerapplet
    nix-direnv
    obs-studio
    pavucontrol
    pcmanfm
    rofi
    scrcpy
    skktools
    steam
    swaylock
    typst
    vivaldi
    vlc
    vscode
    waybar
    wezterm
  ];

  fonts = {
    # Ref: https://nixos.wiki/wiki/Fonts
    # Ref: https://github.com/ryanoasis/nerd-fonts (Nerd Fonts icon glyph patches)
    packages = with pkgs; [
      hackgen-nf-font
      # Noto fonts - wide Unicode coverage including CJK and emoji
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-color-emoji
      # Nerd Fonts - monospace fonts patched with icon glyphs for terminal use
      nerd-fonts._0xproto
      nerd-fonts.jetbrains-mono
      nerd-fonts."m+"
      # General-purpose sans-serif font by Google
      roboto
      rounded-mgenplus
      # Japanese monospace font with Nerd Font icons
      udev-gothic-nf
      # Microsoft TrueType core fonts (Arial, Times New Roman, etc.)
      # Ref: https://corefonts.sourceforge.net/
      corefonts
    ];
    # Make fonts available to applications via /run/current-system/sw/share/fonts
    fontDir.enable = true;
    fontconfig = {
      # System-wide default font fallback order
      defaultFonts = {
        serif = [
          "Rounded Mgen+ 1c" # Japanese serif (covers CJK ideographs)
          "Noto Color Emoji"
        ];
        sansSerif = [
          "Rounded Mgen+ 1c" # Japanese sans-serif
          "Noto Color Emoji"
        ];
        monospace = [
          "HackGen Console NF" # Primary monospace with icon glyphs
          "Noto Color Emoji"
        ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  programs.git = {
    enable = true;
    config = {
      init = {
        defaultBranch = "master";
      };
      user = {
        name = "${githubUsername}";
        email = "${githubEmail}";
      };
      # Delegate GitHub HTTPS credential handling to the gh CLI (runs `gh auth git-credential`)
      credential = {
        "https://github.com".helper = "!gh auth git-credential";
      };
    };
  };
}
