{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./direnv.nix
    ./starship.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
