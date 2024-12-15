{
  nixConfig = {
    extra-substituters = [ "https://cache.asa1984.dev" ];
    extra-trusted-public-keys = [ "cache.asa1984.dev-1:NnXDao1OJ5Cvcgvb488znJH6mTnldKJVlyEHGjAQJLg=" ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    inputs:

    let
      allSystems = [
        "aarch64-linux" # 64-bit ARM Linux
        "x86_64-linux" # 64-bit x86 Linux
        "aarch64-darwin" # 64-bit ARM macOS
        "x86_64-darwin" # 64-bit x86 macOS
      ];
      forAllSystems = inputs.nixpkgs.lib.genAttrs allSystems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = inputs.nixpkgs.legacyPackages.${system};
        in
        rec {
          default = hello-server;
          hello-server = pkgs.callPackage ./hello-server { };
        }
      );
    };
}
