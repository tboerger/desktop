{ machine, nix }:
{
  inherit(machine) distributedBuilds buildMachines;

  package = nix;

  useDaemon  = true;
  maxJobs    = 4;
  buildCores = 2;
  useSandbox = false;

  trustedUsers = [ "root" ];
  allowedUsers = [ "*" ];

  envVars = {
    OBJC_DISABLE_INITIALIZE_FORK_SAFETY = "YES";
  };

  extraOptions = ''
    keep-derivations = true
    show-trace = true
  '';

  nixPath = [
    "darwin-config=$HOME/.nix-config/configuration.nix"
  ];
}
