{ inputs, outputs, ... }:

let
  username = "thomas";
  homeDirectory = "/home/thomas";

in
{
  imports = [
    ../shared/global

    ../shared/programs
    ./programs

    ../shared/services
    ./services
  ];

  profile = {
    programs = {
      act = {
        enable = true;
      };
      clouds = {
        enable = true;
      };
      develop = {
        enable = true;
      };
      dircolors = {
        enable = true;
      };
      direnv = {
        enable = true;
      };
      fonts = {
        enable = true;
      };
      fzf = {
        enable = true;
      };
      golang = {
        enable = true;
      };
      gomplate = {
        enable = true;
      };
      helm = {
        enable = true;
      };
      jq = {
        enable = true;
      };
      jsonnet = {
        enable = true;
      };
      kubectl = {
        enable = true;
      };
      kustomize = {
        enable = true;
      };
      lsd = {
        enable = true;
      };
      neovim = {
        enable = true;
      };
      network = {
        enable = true;
      };
      ngrok = {
        enable = true;
      };
      nodejs = {
        enable = true;
      };
      packwiz = {
        enable = true;
      };
      password = {
        enable = true;
      };
      readline = {
        enable = true;
      };
      sops = {
        enable = true;
      };
      starship = {
        enable = true;
      };
      terraform = {
        enable = true;
      };
      terminal = {
        enable = true;
      };
      yq = {
        enable = true;
      };
    };

    services = {
      owncloud = {
        enable = true;
      };
      syncthing = {
        enable = true;
      };
    };
  };

  home = {
    inherit username homeDirectory;

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
    };

    file = {
      ".local/bin/git-gh-pages" = {
        executable = true;
        source = ./scripts/git-gh-pages.sh;
      };
      ".local/bin/git-promote" = {
        executable = true;
        source = ./scripts/git-promote.sh;
      };

      ".local/bin/search-and-replace" = {
        executable = true;
        source = ./scripts/search-and-replace.sh;
      };

      ".local/bin/each-dir" = {
        executable = true;
        source = ./scripts/each-dir.sh;
      };

      ".local/bin/secrets-encrypt" = {
        executable = true;
        source = ./scripts/secrets-encrypt.sh;
      };
      ".local/bin/secrets-decrypt" = {
        executable = true;
        source = ./scripts/secrets-decrypt.sh;
      };

      ".local/bin/sort-requirements" = {
        executable = true;
        source = ./scripts/sort-requirements.rb;
      };

      ".face" = {
        source = ./face.jpg;
      };
    };

    stateVersion = "23.05";
  };
}
