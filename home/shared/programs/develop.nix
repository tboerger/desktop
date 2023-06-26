{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.develop;

  python310 = pkgs.python310.withPackages (p: with p; [
    boto3
    botocore
    passlib
    requests
  ]);

in
{
  options = {
    profile = {
      programs = {
        develop = {
          enable = mkEnableOption "Develop";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        python310

        ansible
        ansible-lint
        ansible-doctor
        ansible-later

        cfssl
        graphviz
        mediainfo
        neofetch
        reflex
        shellcheck
        silver-searcher
        tldr
        upx
        yamllint
      ];
    };
  };
}
