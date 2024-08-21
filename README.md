# HeitorAugustoLN's NixOS Configurations

This repository contains my personal NixOS configurations, including system and home environment setups. It leverages Nix flakes for reproducibility and ease of management.

**Highlights**:

  - Extensively configured and fully declarative **KDE Plasma 6** environment
  - Declarative **encrypted BTRFS** partitions using [disko](https://github.com/nix-community/disko)
  - Deployment **secrets** using **sops-nix**

## Structure

My configuration structure is based on [misterio77's nix config](https://github.com/Misterio77/nix-config), with some adjustments for my use.

- `.sops.yaml`: Configuration for `sops` and `sops-nix`.
- `shell.nix`: devShell configuration.
- `flake.nix`: Entrypoint for hosts and home configurations. Also exposes a devShell for boostrapping (`nix develop` or `nix-shell`).
- `home/`: Home environment configurations.
- `hosts/`: Host-specific configurations.
- `modules/`: NixOS and home-manager modules, that I haven't upstreamed yet.
- `overlays/`: Patches and version overrides for some packages. Accessible via `nix build`.
- `pkgs/`: My custom packages. Also accessible via `nix build`.

## How to bootstrap

All you need is nix (any version). Run:

```
nix-shell
```

If you already have nix 2.4+, git, and have already enabled `flakes` and
`nix-command`, you can also use the non-legacy command:

```
nix develop
```

`nixos-rebuild --flake .` To build system and user configurations

`nix build` (or shell or run) To build and use packages

`sops` To manage secrets

## Secrets

For deployment secrets (such as user passwords and server service secrets), I'm
using the awesome [`sops-nix`](https://github.com/Mic92/sops-nix). All secrets are encrypted with relevant systems's SSH host keys.

## Tooling and applications I use

Most relevant user apps daily drivers:

- KDE Plasma 6 + [plasma-manager](https://github.com/nix-community/plasma-manager)
- Neovim
- Konsole
- Firefox + [betterfox user.js](https://github.com/HeitorAugustoLN/betterfox-nix)
- Fish
- KDE Connect

## License

This repository is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.
