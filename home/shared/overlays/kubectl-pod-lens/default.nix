{ lib, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "kubectl-pod-lens";
  version = "0.1.2";

  src = fetchFromGitHub {
    owner = "sunny0826";
    repo = "kubectl-pod-lens";
    rev = "v${version}";
    sha256 = "sha256-ZndDViJB23J1V/G36owYG8epk9EoNklLHXoMjaW+zlM=";
  };

  vendorHash = "sha256-sqo7HSLshQwxVHlKX3CrBz0lDom1R6zpgX1TFf4Z6Co=";

  doCheck = false;
  subPackages = [ "cmd/plugin" ];

  postInstall = ''
    mv $out/bin/plugin $out/bin/kubectl-pod_lens
  '';

  meta = with lib; {
    description = "A kubectl plugin to show pod-related resources";
    homepage = "https://github.com/sunny0826/kubectl-pod-lens/";
    license = licenses.asl20;
    maintainers = with maintainers; [ tboerger ];
  };
}
