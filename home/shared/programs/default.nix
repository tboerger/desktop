{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./act.nix
    ./citrix.nix
    ./clouds.nix
    ./develop.nix
    ./dircolors.nix
    ./direnv.nix
    ./fonts.nix
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
    ./network.nix
    ./ngrok.nix
    ./nodejs.nix
    ./packwiz.nix
    ./password.nix
    ./readline.nix
    ./sops.nix
    ./starship.nix
    ./terminal.nix
    ./terraform.nix
    ./yq.nix
  ];

  options = with lib; {
    profile = {
      programs = { };
    };
  };
}
