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
    delve
    go
    golint
    gotools
    jq
    kubectx
    packer
    stern
    yarn
    bzip2
    curl
    gawk
    gnugrep
    gnused
    gnugrep
    mtr
    netcat
    nix
    nix-zsh-completions
    oh-my-zsh
    openssh
    rsync
    which
    zsh-autosuggestions
    zsh-completions
    zsh-syntax-highlighting
    nmap
    wget
    alacritty
    fzf
    htop
    pwgen
    ripgrep
    shellcheck
    silver-searcher
    tree
    tmux
    vim
  ];
}
