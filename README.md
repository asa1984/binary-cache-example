## Example for setting up S3 Binary Cache for Nix

This repository provides `hello-rs` package via the S3 binary cache store (on Cloudflare R2).

GitHub Action builds and signs `hello-rs`, and copies it to the S3 bucket with the `nix copy` command. Binary cache is available via [cache.asa1984.dev](https://cache.asa1984.dev).

### :zap: Requirements

- [Nix](https://nixos.org)
  - Flakes & Nix command need to be enabled
  - It's recommended to use [nix-installer](https://github.com/DeterminateSystems/nix-installer) instead of the official installer

### :package: Install via Binary Cache

Execute following command:

```bash
$ nix run --accept-flake-config github:asa1984/binary-cache-example
Hello, world!
```

### :book: Reference

- [NixOS Binary Cache 2022 | Jeff's Stuff](https://jcollie.github.io/nixos/2022/04/27/nixos-binary-cache-2022.html)
