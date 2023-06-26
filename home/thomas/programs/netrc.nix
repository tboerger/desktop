{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.netrc;

in
{
  options = {
    profile = {
      programs = {
        netrc = {
          enable = mkEnableOption "Netrc" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    homeage = {
      file."netrc" = {
        source = ../../../secrets/thomas/netrc.age;
        symlinks = ["${config.home.homeDirectory}/.netrc"];
        owner = "thomas";
        group = "thomas";
        mode = "0600";
      };
    };
  };
}
