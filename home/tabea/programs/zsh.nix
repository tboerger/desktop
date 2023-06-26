{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.zsh;

in
{
  options = {
    profile = {
      programs = {
        zsh = {
          enable = mkEnableOption "Zsh" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      shellAliases = {
        ".." = "cd ..";
        "..." = "cd ../..";
      };
    };

    programs = {
      zsh = {
        enable = true;

        enableCompletion = true;
        enableAutosuggestions = true;
        enableSyntaxHighlighting = true;

        profileExtra = ''
          [ -r ~/.nix-profile/etc/profile.d/nix.sh ] && source  ~/.nix-profile/etc/profile.d/nix.sh
        '';

        history = {
          size = 10000000;
          save = 10000000;
          extended = true;
          path = "${config.home.homeDirectory}/.zhistory";
        };

        sessionVariables = {
          EDITOR = "vim";
          PAGER = "less";
          CLICOLOR = "1";
          GREP_COLOR = "mt=1;33";
          IGNOREEOF = "1";
        };

        oh-my-zsh = {
          enable = true;
        };
      };
    };
  };
}
