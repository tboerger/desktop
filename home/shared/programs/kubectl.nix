{ pkgs, lib, config, options, ... }:
with lib;

let
  cfg = config.profile.programs.kubectl;

in
{
  options = {
    profile = {
      programs = {
        kubectl = {
          enable = mkEnableOption "Kubectl";
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home = {
      packages = with pkgs; [
        argocd
        clusterctl
        fluxcd
        k9s
        kind
        kubectl
        kubectx
        kubelogin-oidc
        sonobuoy
        stern
      ];

      file = {
        ".local/bin/kubectl-ctx" = {
          source = "${pkgs.kubectx}/bin/kubectx";
          executable = true;
        };
        ".local/bin/kubectl-ns" = {
          source = "${pkgs.kubectx}/bin/kubens";
          executable = true;
        };
      };
    };
  };
}
