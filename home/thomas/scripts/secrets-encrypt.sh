#!/usr/bin/env bash

for FOLDER in $(find . -iname secrets -type d); do
    for FILE in $(find "${FOLDER}" -type f -iname \*.txt); do
        echo "-> decrypting ${FILE}"
        echo bin/vault encrypt "${FILE}"
    done
done
