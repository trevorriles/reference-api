{ system ? builtins.currentSystem, maxLayers ? 20 }:
let
  sources = import ./nix/sources.nix;
  compilerVersion = "ghc865";
  pkgs = import sources.nixpkgs { overlays = (import sources."haskell.nix").overlays; inherit system;};
  app = pkgs.haskell-nix.cabalProject {
    src = pkgs.haskell-nix.haskellLib.cleanGit { src = ./.; };
    ghc = pkgs.buildPackages.pkgs.haskell-nix.compiler.${compilerVersion};
  };
in pkgs.dockerTools.buildLayeredImage {
  name = "app";
  config.Cmd = [ "${app}/bin/app" ];
  inherit maxLayers;
  contents = [
    app
  ];
}
