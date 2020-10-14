#!/bin/sh
# set -eo pipefail

# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision ./.github/secrets/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision.gpg
# gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/certificate.p12 ./.github/secrets/certificate.p12.gpg

# mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

# cp ./.github/secrets/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision


# security create-keychain -p certificate.p12 build.keychain
# security import ./.github/secrets/certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "12345" -A

# security list-keychains -s ~/Library/Keychains/build.keychain
# security default-keychain -s ~/Library/Keychains/build.keychain
# security unlock-keychain -p "ios" ~/Library/Keychains/build.keychain
 
# #!/bin/sh 

# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision ./.github/secrets/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision.gpg
# # gpg --quiet --batch --yes --decrypt --passphrase="$IOS_PROFILE_KEY" --output ./.github/secrets/certificate.p12 ./.github/secrets/certificate.p12.gpg

mkdir -p ~/Library/MobileDevice/Provisioning\ Profiles

cp ./.github/secrets/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision ~/Library/MobileDevice/Provisioning\ Profiles/b9ac9e25-cee2-40bf-9d7c-8fdf7c24764e.mobileprovision


security create-keychain -p "" build.keychain
security import ./.github/secrets/certificate.p12 -t agg -k ~/Library/Keychains/build.keychain -P "" -A

security list-keychains -s ~/Library/Keychains/build.keychain
security default-keychain -s ~/Library/Keychains/build.keychain
security unlock-keychain -p "" ~/Library/Keychains/build.keychain

security set-key-partition-list -S apple-tool:,apple: -s -k "" ~/Library/Keychains/build.keychain