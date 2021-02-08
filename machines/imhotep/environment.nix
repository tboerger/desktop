{ config, lib, pkgs }:
{
  pathsToLink = [
    "/lib"
    "/libexec"
    "/share"
  ];

  shells = with pkgs; [
    bashInteractive
    zsh
  ];

  systemPackages = with pkgs; [
    bzip2
    curl
    nix
    nix-zsh-completions
    oh-my-zsh
    openssh
    rsync
    which
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    wget
    alacritty
    htop
    tree
    tmux
    vim
  ];
}
