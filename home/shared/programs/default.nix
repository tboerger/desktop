{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./direnv.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
