{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.minio;

in
{
  options = {
    profile = {
      programs = {
        minio = {
          enable = mkEnableOption "Minio" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        minio-client
      ];
    };

    homeage = {
      file."minio" = {
        source = ../../../secrets/thomas/minio.age;
        symlinks = ["${config.home.homeDirectory}/.mc/config.json"];
        owner = "thomas";
        group = "thomas";
        mode = "0600";
      };
    };
  };
}
