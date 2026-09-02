{
  description = "Haita development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        haranoaji = pkgs.callPackage ./haranoaji.nix {};
        fontPath = "${haranoaji}/share/fonts/opentype/haranoaji";
        compile = pkgs.writeShellApplication {
          name = "compile";
          runtimeInputs = [
            pkgs.typst
            pkgs.pagefind
            pkgs.git
          ];
          runtimeEnv = {
            TYPST_FONT_PATHS = fontPath;
          };
          text = ''
            cd "$(git rev-parse --show-toplevel)"
            mkdir -p docs
            find docs -mindepth 1 -delete
            typst compile --features bundle,html --format bundle src/main.typ ./docs --root ./
            pagefind --site ./docs
            env -u SOURCE_DATE_EPOCH typst compile --features bundle,html --format pdf src/main.typ ./docs/cvxex-myans.pdf --root ./
          '';
        };
        watch = pkgs.writeShellApplication {
          name = "watch";
          runtimeInputs = [
            pkgs.typst
            pkgs.git
          ];
          runtimeEnv = {
            TYPST_FONT_PATHS = fontPath;
          };
          text = ''
            cd "$(git rev-parse --show-toplevel)"
            mkdir -p docs
            find docs -mindepth 1 -delete
            typst watch --features bundle,html --format bundle src/main.typ ./docs --root ./
          '';
        };
      in {
        apps = {
          compile = {
            type = "app";
            program = "${compile}/bin/compile";
          };
          watch = {
            type = "app";
            program = "${watch}/bin/watch";
          };
        };
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.typst
            pkgs.tinymist
          ];
          TYPST_FONT_PATHS = fontPath;
        };
      }
    );
}
