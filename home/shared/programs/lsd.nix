{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.lsd;

in
{
  options = {
    profile = {
      programs = {
        lsd = {
          enable = mkEnableOption "Lsd";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      lsd = {
        enable = true;
        enableAliases = true;
      };
    };
  };
}
