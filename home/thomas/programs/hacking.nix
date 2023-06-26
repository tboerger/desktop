{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.hacking;

in
{
  options = {
    profile = {
      programs = {
        hacking = {
          enable = mkEnableOption "Hacking" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      file = {
        "Developer/hacking/responder" = {
          source = pkgs.fetchFromGitHub {
            owner = "lgandx";
            repo = "Responder";
            rev = "8e12d2bcfe11cc23e35ea678b9e4979856183d0e";
            sha256 = "sha256-Ek9UyWjI3daU2prKaYF8vsebWO2YzEskn/RrGgKqPR4=";
          };
        };
        "Developer/hacking/seclists" = {
          source = pkgs.fetchFromGitHub {
            owner = "danielmiessler";
            repo = "SecLists";
            rev = "39657bcc05d9dc1637bf30dd0dea0dc70b8ad751";
            sha256 = "sha256-yVxb5GaQDuCsyjIV+oZzNUEFoq6gMPeaIeQviwGdAgY=";
          };
        };
        "Developer/hacking/wordlists/rockyou.txt" = {
          source = pkgs.fetchurl {
            url = "https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt";
            sha256 = "sha256-bfp2qg4CMDmU/RBi0KyYPwtp7OVHTYWlu6NjYuGcEHY=";
          };
        };
      };
    };
  };
}
