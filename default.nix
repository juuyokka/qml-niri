{
  lib,
  stdenv,
  cmake,
  qt6,
}:

let
  qmlOutPath = "$out/${qt6.qtbase.qtQmlPrefix}";
in
stdenv.mkDerivation {
  pname = "qml-niri";
  version = "0.1";

  src = lib.cleanSource ./.;

  nativeBuildInputs = [ cmake ];
  buildInputs = [
    qt6.qtbase
    qt6.qtdeclarative
  ];

  dontWrapQtApps = true;

  installPhase = ''
    mkdir -p ${qmlOutPath}
    cp -R Niri/ ${qmlOutPath}
  '';
}
