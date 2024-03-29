{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.github;

in
{
  options = {
    profile = {
      programs = {
        github = {
          enable = mkEnableOption "GitHub" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      gh = {
        enable = true;

        extensions = with pkgs; [
          gh-dash
          gh-markdown-preview
          gh-poi
        ];
      };
      zsh = {
        sessionVariables = {
          GH_TOKEN = "$(cat ${config.home.homeDirectory}/.ghtoken)";
          GITHUB_TOKEN = "$(cat ${config.home.homeDirectory}/.ghtoken)";
        };
      };
    };

    homeage = {
      file."ghtoken" = {
        source = ../../../secrets/thomas/ghtoken.age;
        symlinks = ["${config.home.homeDirectory}/.ghtoken"];
        owner = "thomas";
        group = "thomas";
        mode = "0600";
      };
    };
  };
}
