{ system ? builtins.currentSystem }:
let
  sources = import ./nix/sources.nix;
  pkgs =import sources.nixpkgs { inherit system; };
in
  pkgs.haskellPackages.callPackage ./default.nix { }