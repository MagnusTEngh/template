{
  description = "Nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
    in
    {
      # Supported platforms
      # systems

      # Packages
      # packages.<system>.<name>

      # Development shells
      # devShells.<system>.<name>

      # Applications
      # apps.<system>.<name>

      # Checks
      # checks.<system>.<name>

      # Overlays
      # overlays.<name>

      # Reusable functions
      # lib.<name>
    };
}