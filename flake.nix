{
  description = "Akeyless Custom Server with Puppeteer for browser-based credential management";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs { inherit system; };
    in {
      packages.default = pkgs.buildNpmPackage {
        pname = "akeyless-custom-server-w-puppeteer";
        version = "0.0.0-dev";
        src = self;
        sourceRoot = "source/node-app";
        npmDepsHash = "sha256-SBfHd2Jo5uII5vBAmTcMIGgstY3lg6b460zBcPpkzZg=";
        dontNpmBuild = true;
        meta = {
          description = "Akeyless Custom Server with Puppeteer for browser-based credential management";
          homepage = "https://github.com/pleme-io/akeyless-custom-server-w-puppeteer";
          license = pkgs.lib.licenses.isc;
        };
      };

      devShells.default = pkgs.mkShellNoCC {
        packages = with pkgs; [ nodejs_22 ];
      };
    });
}
