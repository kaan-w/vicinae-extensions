{
  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } (let
      inherit (import ./nix/lib.nix) mkVicinaeExtension;
    in {
      systems = import inputs.systems;

      flake = {
        inherit mkVicinaeExtension;
        homeManagerModules.default = ./nix/hm-module.nix;
      };

      perSystem = { pkgs, ... }: {
        packages = builtins.mapAttrs
          (name: _: mkVicinaeExtension { inherit pkgs name; })
          (builtins.readDir ./extensions);

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [ nodejs ];
        };
      };
    });
}
