## Archived as of 11/11/2025
See https://github.com/kaan-w/vicinae-extensions/issues/1#issuecomment-3474932155

## Installation
- Add this flake as an input:
```nix
vicinae-extensions = {
  url = "github:kaan-w/vicinae-extensions";
  inputs.nixpkgs.follows = "nixpkgs";
};
```

## Example Configuration
```nix
{ pkgs, inputs, ... }: {
  imports = [
    inputs.vicinae.homeManagerModules.default

    # Extend the Vicinae module to support `services.vicinae.extensions`
    inputs.vicinae-extensions.homeManagerModules.default
  ];

  services.vicinae = {
    enable = true;
    autoStart = true;

    extensions = with inputs.vicinae-extensions.packages.${pkgs.system}; [
      # Built-in extension
      powermenu

      # External extension from GitHub
      (inputs.vicinae-extensions.mkVicinaeExtension {
        inherit pkgs;
        
        # Must match the "name" field in the extension's own package.json file
        name = "hyprpaper-switcher";
        src = pkgs.fetchFromGitHub {
          owner = "lmm1ng";
          repo = "hyprpaper_switcher_ext";
          rev = "a2b4597ea72d4b74c3f92f90c3a67affb7413c72";
          sha256 = "sha256-ZKHlWbvOjZZIZq8hsNCnIinRfVGD5pVtcPgXMURSoxs=";
        };
      })
    ];
  };
}
```
