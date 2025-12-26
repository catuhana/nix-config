# TODO

- [ ] Improve folder structure.

  ```
  nixos-config/
  ├── flake.nix
  ├── hosts/
  │   └── MateBookD14/
  │       ├── default.nix
  │       └── hardware.nix
  ├── modules/
  │   ├── nixos/
  │   │   ├── boot.nix
  │   │   ├── networking.nix
  │   │   ├── locale.nix
  │   │   ├── security.nix
  │   │   ├── nix.nix
  │   │   └── users.nix
  │   ├── desktop/
  │   │   ├── gnome.nix
  │   │   ├── audio.nix
  │   │   └── fonts.nix
  │   ├── programs/
  │   │   └── default.nix
  │   └── services/
  │       └── default.nix
  ├── home/
  │   ├── default.nix
  │   └── programs/
  │       └── git.nix
  └── disks/
      └── MateBookD14.nix
  ```
