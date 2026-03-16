{
  description = "Akeyless Custom Server with Puppeteer for browser-based credential management";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    substrate = { url = "github:pleme-io/substrate"; inputs.nixpkgs.follows = "nixpkgs"; };
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs: (import "${inputs.substrate}/lib/repo-flake.nix" {
    inherit (inputs) nixpkgs flake-utils;
  }) {
    self = inputs.self;
    language = "npm";
    builder = "package";
    pname = "akeyless-custom-server-w-puppeteer";
    npmDepsHash = "sha256-SBfHd2Jo5uII5vBAmTcMIGgstY3lg6b460zBcPpkzZg=";
    dontNpmBuild = true;
    sourceRoot = "source/node-app";
    description = "Akeyless Custom Server with Puppeteer for browser-based credential management";
  };
}
