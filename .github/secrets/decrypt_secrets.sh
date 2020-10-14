#!/bin/sh
set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/mprofile.mobileprovision ./.github/secrets/mprofile.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificate.p12 ./.github/secrets/Certificate.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/mprofile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/mprofile.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/Certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
 
# #!/bin/sh 

# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/mprofile.mobileprovision ./.github/secrets/mprofile.mobileprovision.gpg
# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/Certificate.p12 ./.github/secrets/Certificate.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/mprofile.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/mprofile.mobileprovision


# security create-keychain -p "" build.keychain
# security import ./.github/secrets/Certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "" ~/Library/Keychains/build.keychain

# security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain