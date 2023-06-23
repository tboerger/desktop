{ pkgs, lib, config, options, ... }:

{
  imports = [
    ./starship.nix
    ./minio.nix
  ];
}
