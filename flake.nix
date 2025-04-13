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
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    minimal-tmux = {
      url = "github:niksingh710/minimal-tmux-status";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixvim,
      spicetify-nix,
      minimal-tmux,
      ...
    }:
    let
      system = "x86_64-linux";
      user = "wasituf";
      pkgs = import nixpkgs {
        inherit system;
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
          spicetify-nix.homeManagerModules.default
        ];

        extraSpecialArgs = {
          inherit user;
          inherit spicetify-nix;
          inherit minimal-tmux;
        };
      };
    };
}
