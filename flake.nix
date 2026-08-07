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
        compile = pkgs.writeShellApplication {
          name = "compile";
          runtimeInputs = [
            pkgs.typst
            pkgs.pagefind
            pkgs.git
          ];
          text = ''
            cd "$(git rev-parse --show-toplevel)"
            typst compile --features bundle,html --format bundle src/main.typ ./docs
            pagefind --site ./docs --output-subdir boyd-exercises/pagefind
          '';
        };
      in {
        apps.compile = {
          type = "app";
          program = "${compile}/bin/compile";
        };
        devShells.default = pkgs.mkShell {
          packages = [
            pkgs.typst
            pkgs.tinymist
          ];
        };
      }
    );
}
