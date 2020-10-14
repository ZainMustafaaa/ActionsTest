#!/bin/sh
set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/distributionv1.mobileprovision ./.github/secrets/distributionv1.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/certificate.p12 ./.github/secrets/certificate.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/distributionv1.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/distributionv1.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "12345" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain
 
# #!/bin/sh 

# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/distributionv1.mobileprovision ./.github/secrets/distributionv1.mobileprovision.gpg
# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/certificate.p12 ./.github/secrets/certificate.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/distributionv1.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/distributionv1.mobileprovision


# security create-keychain -p "" build.keychain
# security import ./.github/secrets/certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "" ~/Library/Keychains/build.keychain

# security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain