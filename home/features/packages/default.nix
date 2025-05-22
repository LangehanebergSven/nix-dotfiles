{ pkgs, flake, ... }: {

  home.packages = with pkgs; [
    flake.inputs.devenv.packages.${system}.devenv
    cachix

    nixpkgs-fmt

    _1password-cli
    jq
    gnused
    ripgrep
    unixtools.watch
    nmap
    htop
    coreutils
    pigz
    wget
    kubectl
    kubectx
    kubernetes-helm
    kubent
    uv
    cargo

    nodejs_22

    ory

    docker-client
    docker-buildx
    dive
    bun
    k9s
    gh
    k6
  ];
}

