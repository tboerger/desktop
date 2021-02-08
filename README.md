# desktop

This project defines my declarative configuration for macOS. It is based on [nix](https://nixos.org/learn.html) and [nix-darwin](https://github.com/LnL7/nix-darwin), it should be self-contained including a bootstrap script.

## Bootstrap

To bootstrap this project on a new macOS machine, you have to run the following script after adding the new configuration to it:

```console
curl https://raw.githubusercontent.com/tboerger/desktop/master/bin/bootstrap | bash -s -- $USERNAME $MACHINE
```

## Security

If you find a security issue please contact [thomas@boerger.ws](mailto:thomas@boerger.ws) first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2021 Thomas Boerger <thomas@webhippie.de>
```
