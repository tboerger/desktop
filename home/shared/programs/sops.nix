{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.sops;

in
{
  options = {
    profile = {
      programs = {
        sops = {
          enable = mkEnableOption "Sops";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        sops
      ];
    };
  };
}
