{
  description = "System config NixOS flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
      inherit system;
       
      config = {
        allowUnfree = true;
      };
    };

  in 
  {
  
  nixosConfigurations = {
    nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit system; };
      
      modules = [
       ./nixos/configuration.nix
      ];
    };
  };
    
 };
}

