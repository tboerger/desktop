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
      citrix = {
        enable = true;
      };
      direnv = {
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
      ngrok = {
        enable = true;
      };
      packwiz = {
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
      yq = {
        enable = true;
      };

      minio = {
        enable = true;
      };
      vscode = {
        enable = true;
      };
    };

    services = {
      syncthing = {
        enable = true;
      };
    };
  };

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      LC_ALL = "de_DE.UTF-8";
    };

    file = {
      ".face" = {
        source = ./face.jpg;
      };
    };

    stateVersion = "23.05";
  };
}
