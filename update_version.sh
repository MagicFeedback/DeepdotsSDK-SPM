#!/bin/bash
#
# Updates Package.swift to a new SDK version and publishes the matching
# GitHub release (with the xcframework as an asset).
#
# Usage: ./update_version.sh <new_version> [release_notes_file]
#
# release_notes_file is optional. When provided, its contents are used as the
# GitHub Release notes (via `gh release create --notes-file`). When omitted,
# the release notes fall back to "Release <version>".
#
# Note: the xcframework binary is NOT committed to main. It is only attached
# to the GitHub Release as an asset (which is the URL Package.swift consumes).
# This keeps the repo small and avoids LFS warnings on every release.
#
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <new_version> [release_notes_file]"
  exit 1
fi

NUEVA_VERSION="$1"
NOTES_FILE="${2:-}"
XCFRAMEWORK_ZIP="/Users/sarias/AndroidStudioProjects/DeepdotsPopupSDK/dist/spm/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"

if [ ! -f "$XCFRAMEWORK_ZIP" ]; then
  echo "El archivo $XCFRAMEWORK_ZIP no existe."
  exit 1
fi

# Calculate SwiftPM checksum
CHECKSUM=$(swift package compute-checksum "$XCFRAMEWORK_ZIP")
echo "Checksum calculado: $CHECKSUM"

# Update Package.swift
sed -i '' \
    -e "s|url: \".*\"|url: \"https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/$NUEVA_VERSION/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip\"|" \
    -e "s|checksum: \".*\"|checksum: \"$CHECKSUM\"|" \
    Package.swift

echo "Package.swift actualizado:"
grep -E "url:|checksum:" Package.swift

# Commit Package.swift only. The xcframework binary lives on the GitHub
# Release as an asset; committing it to main would bloat the repo and trip
# GitHub's LFS warning on every release.
git add Package.swift
git commit -m "Release $NUEVA_VERSION"

# Manage tag: drop if it already exists locally/remotely.
if git rev-parse "$NUEVA_VERSION" >/dev/null 2>&1; then
  echo "El tag $NUEVA_VERSION ya existe. Eliminando..."
  git tag -d "$NUEVA_VERSION"
  git push origin ":refs/tags/$NUEVA_VERSION" || true
fi

git tag -a "$NUEVA_VERSION" -m "Release $NUEVA_VERSION"
git push origin main
git push origin "$NUEVA_VERSION"

# Publish (or re-publish) the GitHub Release with the .xcframework.zip asset.
# Without this step, the binaryTarget in Package.swift points at a 404 URL
# and SPM fails with "unexpectedly did not find the new dependency".
if ! command -v gh >/dev/null 2>&1; then
  echo "WARNING: 'gh' CLI no esta instalado. Crea la Release manualmente y sube $XCFRAMEWORK_ZIP"
  exit 1
fi

if gh release view "$NUEVA_VERSION" --repo MagicFeedback/DeepdotsSDK-SPM >/dev/null 2>&1; then
  echo "La Release $NUEVA_VERSION ya existe. Eliminando para re-publicar..."
  gh release delete "$NUEVA_VERSION" --repo MagicFeedback/DeepdotsSDK-SPM --yes
fi

if [ -n "$NOTES_FILE" ] && [ -f "$NOTES_FILE" ]; then
  echo "Usando release notes desde: $NOTES_FILE"
  gh release create "$NUEVA_VERSION" \
    "$XCFRAMEWORK_ZIP" \
    --repo MagicFeedback/DeepdotsSDK-SPM \
    --title "$NUEVA_VERSION" \
    --notes-file "$NOTES_FILE"
else
  echo "Sin release notes externas (usando placeholder). Pasa el path a un archivo como 2do arg para usar contenido del CHANGELOG."
  gh release create "$NUEVA_VERSION" \
    "$XCFRAMEWORK_ZIP" \
    --repo MagicFeedback/DeepdotsSDK-SPM \
    --title "$NUEVA_VERSION" \
    --notes "Release $NUEVA_VERSION"
fi

echo "OK Release $NUEVA_VERSION preparada y subida correctamente."
echo "Asset publicado: $XCFRAMEWORK_ZIP"
