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

OFFICIAL_FINGERPRINT="8E:61:50:2A:4E:14:FC:4B:16:5A:CE:5A:1B:B5:DD:7E:45:D7:5B:DF:08:5F:E2:7C:66:56:5A:8C:EF:27:7A:F1"

BUILD_FINGERPRINT="vendor/matrixx-priv/keys/releasekey.x509.pem"

CERT_FINGERPRINT=$("$KEYTOOL_PATH" -printcert -file "$BUILD_FINGERPRINT" \
    | grep -m1 "SHA256:" \
    | awk -F': ' '{print $2}')

if [ "$CERT_FINGERPRINT" = "$OFFICIAL_FINGERPRINT" ]; then
    echo "OFFICIAL"
else
    echo "UNOFFICIAL"
fi
