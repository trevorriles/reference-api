{ system ? "x86_64-linux" }:
let
  sources = import ./nix/sources.nix;
  pkgs =import sources.nixpkgs { inherit system; };
  app = pkgs.haskellPackages.callPackage ./default.nix { inherit pkgs; };
  staticApp = pkgs.haskell.lib.justStaticExecutables app;
in
  pkgs.dockerTools.buildLayeredImage {
    name = "app";
    tag = "latest";
    config.Cmd = [ "${staticApp}/bin/reference-api" ];
  }
