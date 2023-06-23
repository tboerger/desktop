{
  description = "Home Configuration";

  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };

    homemanager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    homeage = {
      url = "github:jordanisaacs/homeage";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    utils = {
      url = "github:numtide/flake-utils";
    };
  };

  outputs = { self, nixpkgs, homemanager, homeage, ... }@inputs:
    let
      inherit (self) outputs;

      mkHome = usermods: pkgs: homemanager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          inputs.homeage.homeManagerModules.homeage
        ] ++ usermods;
      };
    in
    {
      homeConfigurations = {
        "thomas@anubis" = mkHome [ ./home/thomas/default.nix ] nixpkgs.legacyPackages."x86_64-linux";
        "thomas@chnum" = mkHome [ ./home/thomas/default.nix ] nixpkgs.legacyPackages."x86_64-linux";
        "thomas@horus" = mkHome [ ./home/thomas/default.nix ] nixpkgs.legacyPackages."x86_64-linux";
        "thomas@imhotep" = mkHome [ ./home/thomas/default.nix ] nixpkgs.legacyPackages."x86_64-linux";
        "thomas@osiris" = mkHome [ ./home/thomas/default.nix ] nixpkgs.legacyPackages."x86_64-linux";
      };
    } // inputs.utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import inputs.nixpkgs { inherit system; };
        in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              home-manager
              rage
            ];

            shellHook = ''
              alias age-encrypt="${pkgs.rage}/bin/rage -e -a -i ~/.ssh/id_ed25519"
              alias age-decrypt="${pkgs.rage}/bin/rage -d -a -i ~/.ssh/id_ed25519"
            '';
          };
        }
      );
}
