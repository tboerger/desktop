{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./syncthing.nix
  ];

  options = {
    profile = {
      services = { };
    };
  };
}
