{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.neovim;

in
{
  options = {
    profile = {
      programs = {
        neovim = {
          enable = mkEnableOption "Neovim";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      neovim = {
        enable = true;
      };
    };
  };
}
