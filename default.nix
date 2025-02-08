{
  stdenv,
  fetchFromGitHub,
  cmake,
  python3,
  ninja,
  lib,
  clang,
  glibc,
  autoPatchelfHook,
  zlib,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "packageName";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "kaeeraa";
    repo = "nix-package-template_cpp";
    rev = "main"; # Can be a branch, tag, or commit

    fetchSubmodules = true;
    hash = lib.fakeHash; # Fill with the real hash
  };

  cmakeFlags = [
    "-GNinja"
  ];

  nativeBuildInputs = [
    cmake
    python3
    ninja
    clang
    autoPatchelfHook
  ];

  buildInputs = [
    glibc
    zlib
    stdenv.cc
  ];

  meta = with lib; {
    homepage = "https://github.com/kaeeraa/nix-package-template";
    description = "Nix package template (for C++)";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ kaeeraa ];
  };
})
