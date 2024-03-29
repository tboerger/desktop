{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.starship;

in
{
  options = {
    profile = {
      programs = {
        starship = {
          enable = mkEnableOption "Starship";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      starship = {
        enable = true;

        settings = {
          add_newline = true;

          battery = {
            disabled = true;
          };

          directory = {
            truncation_length = 5;
            truncate_to_repo = false;
            truncation_symbol = "…/";
          };
        };
      };
    };
  };
}
