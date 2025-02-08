{
  stdenv,
  fetchFromGitHub,
  cmake,
  ninja,
  lib,
  clang,
  gcc,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "packageName";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "kaeeraa";
    repo = "nix-package-template_cpp";
    rev = "v${finalAttrs.version}";

    fetchSubmodules = true;
    hash = "sha256-AHloDAuJxKdqK8fqDD9JN6VuSzEtNg9PjnPbRGWPZv0=";
  };

  cmakeFlags = [
    "-GNinja"
  ];

  nativeBuildInputs = [
    cmake
    ninja
    gcc
  ];

  meta = with lib; {
    homepage = "https://github.com/kaeeraa/nix-package-template";
    description = "Nix package template (for C++)";
    license = licenses.mit;
    platforms = platforms.all;
    maintainers = with maintainers; [ kaeeraa ];
  };
})
