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

  home = {
    inherit username homeDirectory;
    stateVersion = "23.05";
  };
}
