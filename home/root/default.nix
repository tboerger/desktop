{ inputs, outputs, ... }:

let
  username = "root";
  homeDirectory = "/root";

in
{
  imports = [
    ../shared/global

    ../shared/programs
    ./programs

    ../shared/services
    ./services
  ];

  profile = {
    programs = {
      dircolors = {
        enable = true;
      };
      direnv = {
        enable = true;
      };
      fzf = {
        enable = true;
      };
      jq = {
        enable = true;
      };
      lsd = {
        enable = true;
      };
      neovim = {
        enable = true;
      };
      readline = {
        enable = true;
      };
      starship = {
        enable = true;
      };
      yq = {
        enable = true;
      };
    };
  };

  home = {
    inherit username homeDirectory;

    sessionPath = [
      "$HOME/.local/bin"
    ];

    sessionVariables = {
      LC_ALL = "en_US.UTF-8";
      LANG = "en_US.UTF-8";
    };

    stateVersion = "23.05";
  };
}
