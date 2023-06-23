{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.packwiz;

in
{
  options = {
    profile = {
      programs = {
        packwiz = {
          enable = mkEnableOption "Packwiz";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        mcrcon
        packwiz
      ];
    };
  };
}
