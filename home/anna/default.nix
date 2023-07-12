{ inputs, outputs, ... }:

let
  username = "anna";
  homeDirectory = "/home/anna";

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
      owncloud = {
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
      terminal = {
        enable = true;
      };
    };

    services = { };
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
