{ config, pkgs, ... }:

{
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure GNOME using dconf
  home-manager.users.ap = { pkgs, lib, ... }: {
    dconf.settings = {
      # GNOME shell configuration
      "org/gnome/settings-daemon/plugins/color" = {
        night-light-enabled = true;
        night-light-temperature = lib.hm.gvariant.mkUint32 3700;
      };
      "org/gnome/shell" = {
        app-picker-layout = lib.hm.gvariant.mkTuple [];
        disable-user-extensions = false;
        enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" ];
        favorite-apps = [
          "com.raggesilver.BlackBox.desktop"
          "chromium-browser.desktop"
          "emacsclient.desktop"
          "nautilus.desktop"
        ];
      };
      "org/gnome/desktop/interface" = {
        monospace-font-name = "Victor Mono 12";
      };
      # Input sources configuration
      "org/gnome/desktop/input-sources" = {
        xkb-options = lib.hm.gvariant.mkArray lib.hm.gvariant.type.string ["ctrl:swapcaps"];
      };
      "org/gnome/desktop/peripherals/touchpad" = {
        tap-to-click = true;
      };
      # Configure the BlackBox terminal emulator
      "com/raggesilver/BlackBox" = {
        font = "Victor Mono 12";
	      theme-light = "Pencil Light";
      };
    };
  };

  # Packages bundled with GNOME I don't want to be installed
  environment.gnome.excludePackages = with pkgs; [
    epiphany
    gnome-tour
    gnome.gedit
    gnome.gnome-software
    gnome-photos
    gnome.totem
    gnome.yelp
  ];

  # Additional packages I want to be installed
  environment.systemPackages = with pkgs; [
    audacity
    bitwarden
    blackbox-terminal
    calibre
    celluloid
    gnome.cheese
    chromium
    foliate
    fragments
    gcolor3
    gimp
    gnome.file-roller
    gnome.geary
    gnome.gnome-music
    gnomeExtensions.appindicator
    krita
    libsForQt5.kdenlive
    obs-studio
    pika-backup
    tdesktop
    victor-mono
    zoom-us
  ];
  
  # Configuration of the Chromium browser
  programs.chromium = {
    enable = true;
    defaultSearchProviderEnabled = true;
    defaultSearchProviderSearchURL = "https://duckduckgo.com/?q={searchTerms}";
    extensions = [
      "mhhlgkfginnlendpfkhcmldikeepoefa" # b&w theme
      "nngceckbapebfimnlniiiahkandclblb" # bitwarden
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # ublock origin      
    ];
    extraOpts = {
      "ShowHomeButton" = true;
      "HomepageLocation" = "https://start.duckduckgo.com";
      "NewTabPageLocation" = "https://start.duckduckgo.com";
    };
  };

}
