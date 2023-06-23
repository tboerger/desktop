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
      starship = {
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
