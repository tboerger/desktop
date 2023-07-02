{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.services.owncloud;

in
{
  options = {
    profile = {
      services = {
        owncloud = {
          enable = mkEnableOption "ownCloud";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    services = {
      owncloud-client = {
        enable = true;
      };
    };
  };
}
