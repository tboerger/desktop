# Desktop

This repository defines the configuration used by my desktop machines. Changes
to this repository are not automatically applied but basically linted on every
push to the `master` branch.

## Bootstrap

Copy multiple files from the private secrets stick on the machine with the
following snippets and finally execute the bootstrap script to clone this
repository. Generally the stick should be mounted automatically.

### Netrc

```console
cp /media/$(id -u)/secrets/netrc ${HOME}/.netrc
chown $(id -u):$(id -g) ${HOME}/.netrc
```

### Token

```console
cp /media/$(id -u)/secrets/ghtoken ${HOME}/.ghtoken
chown $(id -u):$(id -g) ${HOME}/.ghtoken
```

### SSH

```console
mkdir -p ${HOME}/.ssh/
cp /media/$(id -u)/secrets/ssh/id_* ${HOME}/.ssh/
chown $(id -u):$(id -g) .ssh/id_*
```

### Gnupg

```console
for FILE in /media/$(id -u)/secrets/gpg/*.asc; do
    gpg --import $FILE
done
```

### Finish

```console
wget -O- https://raw.githubusercontent.com/tboerger/desktop/master/bin/bootstrap | sudo bash -s -- $MACHINE
```

## Usage

### Anubis

```console
export ANSIBLE_VAULT_PASSWORD=p455w0rd
anubis-galaxy
anubis-playbook -D -C
```

### Chnum

```console
export ANSIBLE_VAULT_PASSWORD=p455w0rd
chnum-galaxy
chnum-playbook -D -C
```

### Horus

```console
export ANSIBLE_VAULT_PASSWORD=p455w0rd
horus-galaxy
horus-playbook -D -C
```

### Imhotep

```console
export ANSIBLE_VAULT_PASSWORD=p455w0rd
imhotep-galaxy
imhotep-playbook -D -C
```

### Osiris

```console
export ANSIBLE_VAULT_PASSWORD=p455w0rd
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
