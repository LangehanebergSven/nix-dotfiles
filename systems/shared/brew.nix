{ pkgs
, ...
}: {

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    brews = [
      "docker-credential-helper"
      "mysql-client"
    ];

    casks = [
      "orbstack"
      "hammerspoon"
      "gitify"
    ];
  };
}
