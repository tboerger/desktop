{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./minio.nix
    ./vscode.nix
  ];
}
