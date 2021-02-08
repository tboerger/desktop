{ config, lib, pkgs, ... }:
let
  machine = "imhotep";
in
{
  environment = import ./environment.nix { inherit config lib pkgs; };

  fonts = {
    enableFontDir = true;

    fonts = with pkgs; [
      hack-font
    ];
  };

  nix = import ./programs/nix.nix {
    machine = nix;
    inherit(pkgs) nix;
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };

  programs = {
    gnupg = import ../../programs/gnupg.nix {};
  };

  time = {
    timeZone = "Europe/Berlin";
  };

  services = services // {
    activate-system = {
      enable = true;
    };

    nix-daemon = {
      enable = true;
    };
  };

  system = import ./system.nix {};
}
