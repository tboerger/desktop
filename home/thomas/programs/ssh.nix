{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.ssh;

in
{
  options = {
    profile = {
      programs = {
        ssh = {
          enable = mkEnableOption "Ssh" // {
            default = true;
          };
        };
      };
    };
  };

  config = mkIf cfg.enable {
    programs = {
      ssh = {
        enable = true;
        forwardAgent = true;

        matchBlocks = {
          "midgard" = {
            hostname = "192.168.1.5";
            port = 22;
            user = "thomas";
          };
          "asgard" = {
            hostname = "192.168.1.10";
            port = 22;
            user = "thomas";
          };
          "utgard" = {
            hostname = "192.168.1.11";
            port = 22;
            user = "thomas";
          };

          "jumphost1.cloudpunks.io" = {
            user = "tboerger";
            forwardAgent = true;
          };
          "*.cloudopserve.io !jumphost1.cloudpunks.io" = lib.hm.dag.entryAfter ["jumphost1.cloudpunks.io"] {
            user = "oper";
            forwardAgent = true;
            proxyJump = "tboerger@jumphost1.cloudpunks.io";
          };
          "*.cloudpunks.io !jumphost1.cloudpunks.io" = lib.hm.dag.entryAfter ["jumphost1.cloudpunks.io"] {
            user = "oper";
            forwardAgent = true;
            proxyJump = "tboerger@jumphost1.cloudpunks.io";
          };
        };
      };
    };
  };
}
