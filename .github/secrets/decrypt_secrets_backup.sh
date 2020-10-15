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


security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain