{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./git.nix
    ./github.nix
    ./gopass.nix
    ./hacking.nix
    ./minio.nix
    ./netrc.nix
    ./netrc.nix
    ./shell.nix
    ./ssh.nix
    ./vscode.nix
  ];
}
