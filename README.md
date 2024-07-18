# nswitch-rcm-nix

A nix flake used for managing automatic (upon-connection) RCM payload injection for the Nintendo Switch. Inspired by [nixtendo-switch](https://github.com/nyawox/nixtendo-switch), this project focuses only on payload injection with the goal of giving the user the freedom to choose their own payload to inject.

## Installation

1) Add this flake to your configuration.
2) Add the following to your configuration:
``` nix
services.nswitch-rcm = {
    enable = true;
    package = <fusee.bin of your choice>
};
```
