{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./owncloud.nix
    ./syncthing.nix
  ];

  options = {
    profile = {
      services = { };
    };
  };
}
