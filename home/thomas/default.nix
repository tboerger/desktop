{ inputs, outputs, ... }:

let
  username = "thomas";
  homeDirectory = "/home/thomas";

in
{
  imports = [
    ../shared/global

    ../shared/programs
    ./programs

    ../shared/services
    ./services
  ];

  profile = {
    programs = {
      direnv = {
        enable = desktop;
      };
    };
  };

  home = {
    inherit username homeDirectory;
    stateVersion = "23.05";
  };
}

# - role: rolehippie.gomplate
# - role: rolehippie.helm
# - role: rolehippie.jsonnet
# - role: rolehippie.krew
# - role: rolehippie.kubectl
# - role: rolehippie.kubetools
# - role: rolehippie.kustomize
# - role: rolehippie.lsd
# - role: rolehippie.ngrok
# - role: rolehippie.packwiz
# - role: rolehippie.sops
# - role: rolehippie.starship
# - role: rolehippie.syncthing
# - role: rolehippie.terraform
# - role: rolehippie.yq

# - role: rolehippie.citrix
# - role: rolehippie.clickup
# - role: rolehippie.clockify
# - role: rolehippie.vscode
