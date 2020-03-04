{ pkgs ? <nixpkgs> }:
pkgs.haskellPackages.callPackage ./app.nix { }
