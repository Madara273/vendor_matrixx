#!/bin/bash

KEYTOOL_PATH="$(command -v keytool)"

if [ -z "$KEYTOOL_PATH" ]; then
    for p in /usr/bin /usr/local/bin /usr/lib/jvm/*/bin; do
        if [ -x "$p/keytool" ]; then
            KEYTOOL_PATH="$p/keytool"
            break
        fi
    done
fi

OFFICIAL_FINGERPRINT="9D:D0:3D:84:36:1E:FA:E3:28:5D:96:34:CA:85:61:8E:76:5D:59:A6:3E:6D:A3:9E:49:26:B3:61:3B:1A:C6:B6"

BUILD_FINGERPRINT="vendor/matrixx-priv/keys/releasekey.x509.pem"

CERT_FINGERPRINT=$("$KEYTOOL_PATH" -printcert -file "$BUILD_FINGERPRINT" \
    | grep -m1 "SHA256:" \
    | awk -F': ' '{print $2}')

if [ "$CERT_FINGERPRINT" = "$OFFICIAL_FINGERPRINT" ]; then
    echo "ALTERNATIVE"
else
    echo "UNOFFICIAL"
fi
