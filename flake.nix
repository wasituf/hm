{
  description = "Home Manager configuration of wasituf";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixgl,
      nixvim,
      ...
    }:
    let
      system = "x86_64-linux";
      user = "wasituf";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ nixgl.overlay ];
      };
    in
    {
      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./profiles/wasituf/user.nix
          ./modules
          ./specialisations.nix
          nixvim.homeManagerModules.nixvim
        ];

        extraSpecialArgs = {
          inherit user;
          inherit nixgl;
        };
      };
    };
}
