#!/bin/sh
set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/distribution.mobileprovision ./.github/secrets/distribution.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/distribution.p12 ./.github/secrets/distribution.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/distribution.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/distribution.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/distribution.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
 
# #!/bin/sh 

# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/distribution.mobileprovision ./.github/secrets/distribution.mobileprovision.gpg
# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/distribution.p12 ./.github/secrets/distribution.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/distribution.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/distribution.mobileprovision


# security create-keychain -p "" build.keychain
# security import ./.github/secrets/distribution.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "" ~/Library/Keychains/build.keychain

# security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain