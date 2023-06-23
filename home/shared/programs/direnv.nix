{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.direnv;

in
{
  options = {
    profile = {
      programs = {
        direnv = {
          enable = mkEnableOption "Direnv";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      direnv = {
        enable = true;
        enableZshIntegration = true;

        nix-direnv = {
          enable = true;
        };
      };
    };
  };
}
