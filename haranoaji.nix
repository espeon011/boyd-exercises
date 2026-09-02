{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "haranoaji";
  version = "20250811";

  src = fetchFromGitHub {
    owner = "trueroad";
    repo = "HaranoAjiFonts";
    tag = finalAttrs.version;
    hash = "sha256-V9T+V+vCNMYMf5xe/EO4n2tyQb23Q1cnkmy259iuQLk=";
  };

  installPhase = ''
    runHook preInstall
    install -Dm444 *.otf -t $out/share/fonts/opentype/haranoaji
    runHook postInstall
  '';

  meta = {
    description = "原ノ味フォント (Harano Aji Fonts)";
    homepage = "https://github.com/trueroad/HaranoAjiFonts";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
  };
})
