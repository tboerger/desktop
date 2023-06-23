{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.fzf;

in
{
  options = {
    profile = {
      programs = {
        fzf = {
          enable = mkEnableOption "Fzf";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      fzf = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
