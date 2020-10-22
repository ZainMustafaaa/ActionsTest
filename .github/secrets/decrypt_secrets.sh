#!/bin/sh
# set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision ./.github/secrets/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificate.p12 ./.github/secrets/Certificate.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision


# security create-keychain -p Certificate.p12 build.keychain
# security import ./.github/secrets/Certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "12345" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "ios" ~/Library/Keychains/build.keychain
 
# #!/bin/sh 

# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision ./.github/secrets/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision.gpg
# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificate.p12 ./.github/secrets/Certificate.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/bc07e9c5-bf69-404b-ad84-73d9f80aea1b.mobileprovision

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
IOS_UUID=$(security find-identity -v -p codesigning "$KEYCHAIN" | head -1 | 
grep '"' | awk '{print $2}')

security set-key-partition-list -S apple-tool:,apple: -s -k $KEYCHAIN_PASSWORD $KEYCHAIN
