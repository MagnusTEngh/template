{
  description = "Nix flake for {{ project_name }}";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSystem = nixpkgs.lib.genAttrs systems;
      
      # Common packages for all systems
      commonPackages = pkgs: with pkgs; [
        # Python tooling
        uv
      ];
    in
    forEachSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages = {
        # Default package (can be overridden)
        default = pkgs.hello;
      };

      devShells = {
        default = pkgs.mkShell {
          name = "{{ project_name }} dev environment";
          
          # Include uv for Python development
          packages = commonPackages pkgs;
          
          # Environment variables
          shellHook = ''
            echo "Welcome to {{ project_name }} development environment!"
            echo "uv is available for Python package management"
          '';
        };
      };
    });
}
