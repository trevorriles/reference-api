{ system ? builtins.currentSystem, ... }:
let
  sources = import ./nix/sources.nix;
  pkgs =import sources.nixpkgs { inherit system; };
  app = pkgs.haskellPackages.callPackage ./app.nix { };
in pkgs.haskell.lib.justStaticExecutables app
