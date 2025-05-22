{ pkgs, ... }: {

  home.packages = with pkgs; [
    delta
  ];

  programs.git = {
    enable = true;
    package = pkgs.git;
    lfs = {
      enable = true;
    };

    userName = "Sven Langehaneberg";
    userEmail = "s.langehaneberg@shopware.com";

    signing.key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbzfO3K+tx+W1pzLmWudwzyyCyxqhZIBOwOku+zbiYBPrr8RCgcQRg3jlOD6iD1GeA/SlSUrzL4S9RTf+zN2x9xspcaU4m9Gb1jOAPH+rNUkb9BTUTk03CMK52X4upsNh4KLJO5B8x/ap0dd61wTvsFc3IzOeKzqiQjIwAo+El1HixslQvTSwWYiL9UKbIOVOk2B36Yw7RII8RS+FfNBSjX1v+wLOGX81gSCB/cPAkMdT7KlF/EKwdymncCa2imG4am+u0irb4y0hzflpOzHVW0B24wmqsIJ9YwGyVWHneAaNLOm3OmM9EsY5yKIw/2AFpQJ3QCvq5hc1/mmIxF/mlgm5aMnxHZjXN0JYyVJIx9BbJFsQFmOvNCs9FKIbdIqsKqfCDNZ4YnJ7HV0xK4Ww0aOo0immHVR49ELxTO2P9DqOQ935s+CozhRoXw210kHR++eLORtsPLSFeFIfH05klDL/yGIQ3oV46gMLAfInNYi0jwpnQcfDZo0P0I2ygbgs=";
    signing.signByDefault = true;

    extraConfig = {
      push.autoSetupRemote = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      rebase.autoStash = true;
      push.default = "simple";
      fetch.prune = true;

      gpg.format = "ssh";
    };
  };

  programs.lazygit = {
    enable = true;
    settings = {
      promptToReturnFromSubprocess = false;
      git = {
        overrideGpg = true;
        paging = {
          colorArg = "always";
          pager = "delta --dark --paging=never";
        };
      };
    };
  };

  home.file = {
    ".ssh/allowed_signers".text = "s.langehaneberg@shopware.com namespaces=\"git\" ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCbzfO3K+tx+W1pzLmWudwzyyCyxqhZIBOwOku+zbiYBPrr8RCgcQRg3jlOD6iD1GeA/SlSUrzL4S9RTf+zN2x9xspcaU4m9Gb1jOAPH+rNUkb9BTUTk03CMK52X4upsNh4KLJO5B8x/ap0dd61wTvsFc3IzOeKzqiQjIwAo+El1HixslQvTSwWYiL9UKbIOVOk2B36Yw7RII8RS+FfNBSjX1v+wLOGX81gSCB/cPAkMdT7KlF/EKwdymncCa2imG4am+u0irb4y0hzflpOzHVW0B24wmqsIJ9YwGyVWHneAaNLOm3OmM9EsY5yKIw/2AFpQJ3QCvq5hc1/mmIxF/mlgm5aMnxHZjXN0JYyVJIx9BbJFsQFmOvNCs9FKIbdIqsKqfCDNZ4YnJ7HV0xK4Ww0aOo0immHVR49ELxTO2P9DqOQ935s+CozhRoXw210kHR++eLORtsPLSFeFIfH05klDL/yGIQ3oV46gMLAfInNYi0jwpnQcfDZo0P0I2ygbgs=";
  };
}
