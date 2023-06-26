{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.nodejs;

in
{
  options = {
    profile = {
      programs = {
        nodejs = {
          enable = mkEnableOption "Nodejs";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        nodejs_18
        yarn
      ];
    };
  };
}
