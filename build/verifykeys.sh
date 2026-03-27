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

OFFICIAL_FINGERPRINT="7B:86:86:5B:88:12:84:BB:AE:A7:0F:02:0D:2D:2C:AF:67:AA:9B:1A:76:33:7B:B3:FB:01:3D:65:43:71:75:CD"

BUILD_FINGERPRINT="vendor/matrixx-priv/keys/releasekey.x509.pem"

CERT_FINGERPRINT=$("$KEYTOOL_PATH" -printcert -file "$BUILD_FINGERPRINT" \
    | grep -m1 "SHA256:" \
    | awk -F': ' '{print $2}')

if [ "$CERT_FINGERPRINT" = "$OFFICIAL_FINGERPRINT" ]; then
    echo "OFFICIAL"
else
    echo "UNOFFICIAL"
fi
