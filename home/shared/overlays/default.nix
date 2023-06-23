self: super:

{
  citrix_workspace = super.citrix_workspace.overrideAttrs (old: {
    src = super.fetchurl {
      name = "linuxx64-22.12.0.12.tar.gz";
      url = "https://dl.webhippie.de/misc/citrix-workspace-x64-22.12.0.12.tar.gz";
      hash = "sha256-PsWj1VJqa6wXu5d7FzVC9b3VNaU7qm3KgMg6DWEinXQ=";
    };
  });

  vscode-extensions = self.lib.recursiveUpdate super.vscode-extensions {
    dzhavat.bracket-pair-toggler = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "bracket-pair-toggler";
      publisher = "dzhavat";
      version = "0.0.3";
      sha256 = "sha256-mjsh+jwr1ygtOEiZ3juaEuxPZQxdM3QOHxO/e2ht4Ho=";
    };
    shakram02.bash-beautify = self.vscode-utils.extensionFromVscodeMarketplace {
      name = "bash-beautify";
      publisher = "shakram02";
      version = "0.1.1";
      sha256 = "sha256-pg1nGEk+cn7VlmJeDifXkXeZJLRrEFOyW0bK9W6VGfc=";
    };
  };

  khelm = super.callPackage ./khelm { };
  ksops = super.callPackage ./ksops { };
}
