{ system ? "x86_64-linux" }:
let
  sources = import ./nix/sources.nix;
  pkgs =import sources.nixpkgs { inherit system; };
  app = pkgs.haskellPackages.callPackage ./app.nix { };
in
  pkgs.dockerTools.buildLayeredImage {
    name = "app";
    tag = "latest";
    config.Cmd = [ "${app}/bin/reference-api" ];
  }
