{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./citrix.nix
    ./direnv.nix
    ./fzf.nix
    ./golang.nix
    ./gomplate.nix
    ./helm.nix
    ./jq.nix
    ./jsonnet.nix
    ./kubectl.nix
    ./kustomize.nix
    ./lsd.nix
    ./neovim.nix
    ./ngrok.nix
    ./packwiz.nix
    ./readline.nix
    ./sops.nix
    ./starship.nix
    ./terraform.nix
    ./yq.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
