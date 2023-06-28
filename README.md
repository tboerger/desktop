# Desktop

This repository defines the configuration used by my desktop machines. Changes
to this repository are not automatically applied but basically linted on every
push to the `master` branch.

## Bootstrap

After following the steps of the installation below you got to copy SSH and
GnuPG keys from the private secrets stick on the machine with the following
snippets and finally execute the bootstrap script to clone this repository.
Generally the stick should be mounted automatically.

### Screenshots

<details>
<summary>Select Language</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install01.png)
</details>

<details>
<summary>Keyboard Layout</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install02.png)
</details>

<details>
<summary>Language Support</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install03.png)
</details>

<details>
<summary>Select Location</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install04.png)
</details>

<details>
<summary>Select Disk</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install05.png)
</details>

<details>
<summary>Encryption Passphrase</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install06.png)
</details>

<details>
<summary>Select Network</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install07.png)
</details>

<details>
<summary>Enable Root</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install08.png)
</details>

<details>
<summary>User Details</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install09.png)
</details>

<details>
<summary>Create User</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install10.png)
</details>

<details>
<summary>Install Summary</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install11.png)
</details>

<details>
<summary>Reboot System</summary>

![](https://raw.githubusercontent.com/tboerger/desktop/master/screenshots/install12.png)
</details>

### Install

### SSH

```console
mkdir -p ${HOME}/.ssh/
cp /media/$(whoami)/secrets/ssh/id_* ${HOME}/.ssh/
chown -R $(id -u):$(id -g) ${HOME}/.ssh
```

### Gnupg

```console
for FILE in /media/$(whoami)/secrets/gpg/*.asc; do
    gpg --import ${FILE}
done
```

### Finish

```console
wget -O- https://raw.githubusercontent.com/tboerger/desktop/master/bin/bootstrap | sudo bash -s -- $MACHINE
echo p455w0rd > /home/$(whoami)/.desktop/.vaultpasswd && chown $(id -u):$(id -g) /home/$(whoami)/.desktop/.vaultpasswd
```

## Usage

### Anubis

```console
anubis-selfupdate
anubis-playbook -D -C
```

### Chnum

```console
chnum-selfupdate
chnum-playbook -D -C
```

### Horus

```console
horus-selfupdate
horus-playbook -D -C
```

### Imhotep

```console
imhotep-selfupdate
imhotep-playbook -D -C
```

### Osiris

```console
osiris-selfupdate
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
