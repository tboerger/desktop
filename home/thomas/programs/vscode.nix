{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.vscode;

in
{
  options = {
    profile = {
      programs = {
        vscode = {
          enable = mkEnableOption "Vscode" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      vscode = {
        enable = true;
        enableUpdateCheck = false;

        extensions = with pkgs.vscode-extensions; [
          dzhavat.bracket-pair-toggler
          editorconfig.editorconfig
          foxundermoon.shell-format
          golang.go
          hashicorp.terraform
          jnoortheen.nix-ide
          mikestead.dotenv
          ms-azuretools.vscode-docker
          ms-kubernetes-tools.vscode-kubernetes-tools
          ms-python.python
          ms-vscode-remote.remote-ssh
          naumovs.color-highlight
          octref.vetur
          redhat.vscode-yaml
          shakram02.bash-beautify
          timonwong.shellcheck
          yzhang.markdown-all-in-one
          zxh404.vscode-proto3
        ];

        userSettings = {
          "workbench.colorTheme" = "Solarized Dark";
          "workbench.startupEditor" = "none";

          "redhat.telemetry.enabled" = true;
          "git.enableSmartCommit" = true;

          "editor.renderControlCharacters" = true;
          "editor.renderWhitespace" = "all";

          "editor.rulers" = [
            80
          ];

          "files.insertFinalNewline" = true;
          "files.trimTrailingWhitespace" = true;

          "go.useLanguageServer" = true;

          "[python]" = {
            "editor.formatOnType" = true;
          };
          "[vue]" = {
            "editor.defaultFormatter" = "octref.vetur";
          };
        };
      };
    };
  };
}
