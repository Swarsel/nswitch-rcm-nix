# nswitch-rcm-nix

A nix flake used for managing automatic (upon-connection) RCM payload injection for the Nintendo Switch. Inspired by [nixtendo-switch](https://github.com/nyawox/nixtendo-switch), this project focuses only on payload injection with the goal of giving the user the freedom to choose their own payload to inject.

## Installation

1) Add this flake to your configuration:
    1) add nswitch-rcm-nix under `inputs`:
    ``` nix
     inputs = {
     # your other flake inputs, such as nixpkgs, here ...
     nswitch-rcm-nix.url = github:Swarsel/nswitch-rcm-nix;
     };
    ```
    1) add the nswitch-rcm module in your `output` configuration:
    ``` nix
      modules = [
      # your configuration.nix and others here ...
      nswitch-rcm-nix.nixosModules.nix
      ];
    ```
2) Add the following to your `configuration.nix`:
``` nix
services.nswitch-rcm = {
    enable = true;
    package = # package with payload of your choice
};
```

###### Fully working configuration example for Atmosphere 1.3.2

``` nix
services.nswitch-rcm = {
      enable = true;
      package =  (pkgs.fetchurl {
        url = "https://github.com/Atmosphere-NX/Atmosphere/releases/download/1.3.2/fusee.bin";
        hash = "sha256-5AXzNsny45SPLIrvWJA9/JlOCal5l6Y++Cm+RtlJppI=";
      });
    };
```


## Instruction (how to use)

1) Make sure your Switch is in RCM mode (my recommendation is to use [AutoRCM](https://switch.hacks.guide/extras/autorcm/))
2) Make sure your PC has a connection to the Switch (use `dmesg --follow` to check what happens upon plugin)
3) The specified payload should be injected to the Switch as soon as the connection is established.
