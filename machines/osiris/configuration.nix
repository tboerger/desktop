{ config, pkgs, options, ... }:
let
  machine = "osiris";
in
{
  environment = import ./environment.nix { inherit config pkgs; };

  fonts = {
    enableFontDir = true;

    fonts = with pkgs; [
      hack-font
    ];
  };

  nix = import ../../programs/nix.nix { inherit options };

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

