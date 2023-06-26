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
          "midgard" = hm.dag.entryBefore ["asgard"] {
            hostname = "192.168.1.5";
            port = 22;
            user = "thomas";
          };
          "asgard" = hm.dag.entryBefore ["utgard"] {
            hostname = "192.168.1.10";
            port = 22;
            user = "thomas";
          };
          "utgard" = {
            hostname = "192.168.1.11";
            port = 22;
            user = "thomas";
          };

          "*.cloudpunks.io" = {
            user = "oper";
            forwardAgent = true;
            proxyJump = "tboerger@jumphost1.cloudpunks.io";
          };
          "jumphost1.cloudpunks.io" = hm.dag.entryBefore ["*.cloudpunks.io"] {
            user = "tboerger";
            forwardAgent = true;
          };
        };
      };
    };
  };
}
