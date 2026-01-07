{ inputs, ... }: {
  imports = [ inputs.matugen.homeManagerModules.default ];

  programs.matugen = {
    enable = true;
    templates = {
    
      kitty = {
        input_path = ../templates/kitty.conf;
        output_path = "~/.config/kitty/colors.conf";
        post_hook = "pkill -SIGUSR1 kitty"; 
      };
      
    };
  };
}