let
  sources = import ./nix/sources.nix;
  compilerVersion = "ghc865";
  pkgs = (import sources.nixpkgs) (import sources."haskell.nix");
in
pkgs.haskell-nix.cabalProject {
  src = pkgs.haskell-nix.haskellLib.cleanGit { src = ./.; };
  ghc = pkgs.buildPackages.pkgs.haskell-nix.compiler.${compilerVersion};
}
