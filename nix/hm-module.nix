{ config, lib, ... }: {
  options.services.vicinae.extensions = lib.mkOption {
    type = with lib.types; listOf package;
    default = [];
    description = "List of Vicinae extensions to declaratively install.";
  };

  config = lib.mkIf (config.services.vicinae.extensions != []) {
    xdg.dataFile = builtins.listToAttrs (
      builtins.map 
        (item: { 
          name = "vicinae/extensions/${item.name}";
          value.source = item;
        }) 
        config.services.vicinae.extensions
    );
  };
}