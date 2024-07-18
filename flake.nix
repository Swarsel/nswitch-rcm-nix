{
  description = "A nix flake for managing auto RCM payload injection for the Nintendo Switch";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { flake-parts, ... } @ inputs :
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux"
                  "aarch64-linux"
                  "aarch64-darwin"
                  "x86_64-darwin"];

      flake.nixosModules = {
        nswitch-rcm = {
          imports = [
            modules/nswitch-rcm.nix
          ];
        };
      };
    };
}
