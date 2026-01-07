{
  description = "NixOS configuration for gabzu's laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    matugen.url = "github:InioX/matugen";
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations.asphodelus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      specialArgs = { inherit inputs home-manager; };
      
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          # home-manager.useGlobalPackages = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.gabzu = {
            imports = [ ./home.nix ]; 
          };
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}