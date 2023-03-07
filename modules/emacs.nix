{ pkgs, ... }:

{
  home-manager.users.ap = { pkgs, lib, ... }: {
    # Emacs configuration
    programs.emacs = {
      enable = true;
      package = with pkgs; (emacsPackagesFor emacs-gtk).emacsWithPackages (epkgs: with epkgs; [
        vterm
      ]);
    };

    # Emacs configuration files
    xdg.configFile."emacs".recursive = true;
    xdg.configFile."emacs".source = ../configs/emacs;

    # Packages needed by emacs
    home.packages = with pkgs; [
      clang-tools
      tree-sitter
      haskell-language-server
      python310Packages.pyflakes
      python-language-server
    ];
  };
}
