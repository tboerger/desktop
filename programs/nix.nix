{ options }:
{
  useDaemon = true;
  maxJobs = 4;
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

  nixPath = options.nix.nixPath.default ++ [
    '$HOME/.nix-defexpr/channels'
  ];
}
