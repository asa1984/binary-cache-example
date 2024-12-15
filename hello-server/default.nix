{ rustPlatform, ... }:
rustPlatform.buildRustPackage {
  name = "hello-server";
  src = ./.;
  cargoLock = {
    lockFile = ./Cargo.lock;
  };
}
