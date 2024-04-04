{ rustPlatform, ... }:
rustPlatform.buildRustPackage {
  name = "hello-rs";
  src = ./.;
  cargoLock = { lockFile = ./Cargo.lock; };
}
