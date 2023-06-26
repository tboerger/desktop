{ inputs, outputs, ... }:

let
  username = "adrian";
  homeDirectory = "/home/adrian";

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
      dircolors = {
        enable = true;
      };
      lsd = {
        enable = true;
      };
      packwiz = {
        enable = true;
      };
      readline = {
        enable = true;
      };
      starship = {
        enable = true;
      };
      wezterm = {
        enable = true;
      };
    };
  };

  home = {
    inherit username homeDirectory;

    sessionVariables = {
      LC_ALL = "de_DE.UTF-8";
      LANG = "de_DE.UTF-8";
    };

    file = {
      ".face" = {
        source = ./face.jpg;
      };
    };

    stateVersion = "23.05";
  };
}
