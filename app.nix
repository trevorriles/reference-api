{ mkDerivation, base, hpack, stdenv, ... }:
mkDerivation {
  pname = "reference-api";
  version = "0.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  libraryHaskellDepends = [ base ];
  libraryToolDepends = [ hpack ];
  executableHaskellDepends = [ base ];
  prePatch = "hpack";
  license = stdenv.lib.licenses.mit;
}
