{
  nixConfig = {
    extra-substituters = [ "cache.asa1984.dev" ];
    extra-trusted-public-keys =
      [ "cache.asa1984.dev-1:NnXDao1OJ5Cvcgvb488znJH6mTnldKJVlyEHGjAQJLg=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages = rec {
          default = hello-rs;
          hello-rs = pkgs.callPackage ./default.nix { };
        };
        devShells = {
          ci = pkgs.mkShell { packages = with pkgs; [ awscli ]; };
        };
      });
}
