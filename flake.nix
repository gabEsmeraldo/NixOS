{
  description = "NixOS configuration for gabzu's laptop";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Added @ inputs here
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: {
    nixosConfigurations.asphodelus = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      
      # Now 'inputs' is defined and can be inherited
      specialArgs = { inherit inputs home-manager; };
      
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          # home-manager.useGlobalPackages = true;
          home-manager.useUserPackages = true;
          home-manager.users.gabzu = import ./home.nix;
          home-manager.backupFileExtension = "backup";
        }
      ];
    };
  };
}