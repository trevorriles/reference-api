{ system ? builtins.currentSystem, ... }:
let
  sources = import ./nix/sources.nix;
  pkgs =import sources.nixpkgs { inherit system; };
  app = import ./default.nix { inherit pkgs; };
in app
