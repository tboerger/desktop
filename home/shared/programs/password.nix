{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.password;

in
{
  options = {
    profile = {
      programs = {
        password = {
          enable = mkEnableOption "Password";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        lastpass-cli
        pwgen
      ];
    };
  };
}
