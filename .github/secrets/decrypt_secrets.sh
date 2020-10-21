mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/provissioning.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/provissioning.mobileprovision
KEYCHAIN="MyApp$$.keychain"
KEYCHAIN_PASSWORD="MyApp"

security create-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"
security list-keychains -d user -s "$KEYCHAIN" $(security list-keychains -d user | sed s/\"//g)
security list-keychains

# Unlock keychain
security set-keychain-settings "$KEYCHAIN"
security unlock-keychain -p "$KEYCHAIN_PASSWORD" "$KEYCHAIN"

security import ./.github/secrets/Certificate.p12 -t agg -k "$KEYCHAIN" -P "" -T "/usr/bin/codesign"

# Detect the iOS identity
IOS_IDENTITY=$(security find-identity -v -p codesigning "$KEYCHAIN" | head -1 | grep '"' | sed -e 's/[^"]*"//' -e 's/".*//')
IOS_UUID=$(security find-identity -v -p codesigning "$KEYCHAIN" | head -1 | grep '"' | awk '{print $2}')

security set-key-partition-list -S apple-tool:,apple: -s -k $KEYCHAIN_PASSWORD $KEYCHAIN