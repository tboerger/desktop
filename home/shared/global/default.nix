{ pkgs, lib, config, options, ... }:

{
  homeage = {
    identityPaths = [ "~/.ssh/id_ed25519" ];
    installationType = "systemd";
  };

  programs = {
    home-manager = {
      enable = true;
    };
  };

  systemd = {
    user = {
      startServices = "sd-switch";
    };
  };
}
