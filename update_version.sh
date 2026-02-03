#!/bin/bash

# Script para actualizar versión del SDK en Package.swift y subir la release SPM
# Uso: ./update_version.sh <nueva_version>

set -e

if [ -z "$1" ]; then
  echo "Uso: $0 <nueva_version>"
  exit 1
fi

NUEVA_VERSION="$1"
XCFRAMEWORK_ZIP="/Users/sarias/AndroidStudioProjects/DeepdotsPopupSDK/dist/spm/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"

# Verificar que el archivo .zip existe
if [ ! -f "$XCFRAMEWORK_ZIP" ]; then
  echo "El archivo $XCFRAMEWORK_ZIP no existe."
  exit 1
fi

# Calcular checksum con SwiftPM
CHECKSUM=$(swift package compute-checksum "$XCFRAMEWORK_ZIP")

echo "Checksum calculado: $CHECKSUM"

# Crear carpeta para la release local (opcional, para verificación)
UPLOAD_DIR="releases/download/$NUEVA_VERSION"
mkdir -p "$UPLOAD_DIR"
cp "$XCFRAMEWORK_ZIP" "$UPLOAD_DIR/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"

# Actualizar Package.swift
sed -i '' \
    -e "s|url: \".*\"|url: \"https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/$NUEVA_VERSION/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip\"|" \
    -e "s|checksum: \".*\"|checksum: \"$CHECKSUM\"|" \
    Package.swift

echo "Package.swift actualizado:"
grep -E "url:|checksum:" Package.swift

# Confirmar cambios y crear commit
git add Package.swift
git add "$UPLOAD_DIR/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"
git commit -m "Release $NUEVA_VERSION"

# Manejar tag: eliminar si ya existe
if git rev-parse "$NUEVA_VERSION" >/dev/null 2>&1; then
  echo "El tag $NUEVA_VERSION ya existe. Eliminando..."
  git tag -d "$NUEVA_VERSION"
  git push origin :refs/tags/$NUEVA_VERSION
fi

# Crear nuevo tag
git tag -a "$NUEVA_VERSION" -m "Release $NUEVA_VERSION"

# Subir cambios y tag al repo remoto
git push origin main
git push origin "$NUEVA_VERSION"

echo "✅ Release $NUEVA_VERSION preparada y subida correctamente."
echo "Archivo .xcframework listo en: $UPLOAD_DIR/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"
