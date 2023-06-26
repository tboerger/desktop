{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.fonts;

  nerdfonts = pkgs.nerdfonts.override {
    fonts = [
      "FiraCode"
    ];
  };

in
{
  options = {
    profile = {
      programs = {
        fonts = {
          enable = mkEnableOption "Fonts";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        nerdfonts
      ];
    };
  };
}
