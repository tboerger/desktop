# Desktop

This repository defines the configuration used by my desktop machines. Changes
to this repository are not automatically applied but basically linted on every
push to the `master` branch.

## Bootstrap

To bootstrap this project on a new machine, you have to run the following script
after adding the new configuration to it:

```console
curl -sSL https://raw.githubusercontent.com/tboerger/desktop/master/bin/bootstrap | sudo bash -s -- $MACHINE
```

## Usage

### Anubis

```console
anubis-galaxy
anubis-playbook -D -C
```

### Chnum

```console
chnum-galaxy
chnum-playbook -D -C
```

### Horus

```console
horus-galaxy
horus-playbook -D -C
```

### Imhotep

```console
imhotep-galaxy
imhotep-playbook -D -C
```

### Osiris

```console
osiris-galaxy
osiris-playbook -D -C
```

## Security

If you find a security issue please contact
[thomas@webhippie.de](mailto:thomas@webhippie.de) first.

## Contributing

Fork -> Patch -> Push -> Pull Request

## Authors

-   [Thomas Boerger](https://github.com/tboerger)

## License

Apache-2.0

## Copyright

```console
Copyright (c) 2023 Thomas Boerger <thomas@webhippie.de>
```
