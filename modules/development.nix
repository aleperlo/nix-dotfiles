{ config, pkgs, ... }:

{
  # Packages used for development
  environment.systemPackages = with pkgs; [
    # CLI utils
    bat
    exa
    fd
    file
    imagemagick
    ripgrep
    # Compilers, debuggers and build tools
    ghc
    gnumake
    python3
    valgrind
    # Texlive
    (texlive.combine { inherit (texlive)
      scheme-small
      capt-of
      nopageno
      verse
      wrapfig;})
  ];

  # Configure the starship shell prompt
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
    };
  };

  # Bash and direnv configuration
  home-manager.users.ap = { pkgs, ... }: {
    programs.bash = {
      enable = true;
      shellAliases = {
        ls = "exa --classify";
        tree = "exa --tree";
        newdenv = "echo \"use nix\" > .envrc && direnv allow";
      };
    };

    programs.readline = {
      enable = true;
      bindings = {
        "\\e[A" = "history-search-backward";
        "\\e[B" = "history-search-forward";
      };
      variables = {
        completion-ignore-case = true;
      };
    };

    programs.direnv = {
      enable = true;
      enableBashIntegration = true;
      nix-direnv.enable = true;
    };
  };

}
