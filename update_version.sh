#!/bin/bash

# Este script actualiza la versión del SDK en el archivo Package.swift y sube los archivos necesarios.
# Uso: ./update_version.sh <nueva_version>

set -e

NUEVA_VERSION="0.1.3"  # Reemplaza con la nueva versión deseada
XCFRAMEWORK_ZIP="/Users/sarias/AndroidStudioProjects/DeepdotsPopupSDK/dist/spm/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"

# Verificar que el archivo .zip existe
if [ ! -f "$XCFRAMEWORK_ZIP" ]; then
  echo "El archivo $XCFRAMEWORK_ZIP no existe."
  exit 1
fi

# Leer el checksum del archivo /Users/sarias/AndroidStudioProjects/DeepdotsPopupSDK/dist/spm/DeepdotsSDK-0.1.3.xcframework.zip.checksum
CHECKSUM=$(cat "$XCFRAMEWORK_ZIP.checksum")

# Subir el archivo .zip a la carpeta correspondiente
UPLOAD_DIR="releases/download/$NUEVA_VERSION"
mkdir -p "$UPLOAD_DIR"
cp "$XCFRAMEWORK_ZIP" "$UPLOAD_DIR/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip"

# Actualizar el archivo Package.swift
sed -i '' \
    -e "s|url: \".*\"|url: \"https://github.com/MagicFeedback/DeepdotsSDK-SPM/releases/download/$NUEVA_VERSION/DeepdotsSDK-$NUEVA_VERSION.xcframework.zip\"|" \
    -e "s|checksum: \".*\"|checksum: \"$CHECKSUM\"|" \
    Package.swift

# Confirmar cambios
cat <<EOF
Actualización completada:
- Versión: $NUEVA_VERSION
- Checksum: $CHECKSUM
- Archivo actualizado: Package.swift
EOF

# Crear un commit con los cambios realizados
git add Package.swift "$UPLOAD_DIR"
git commit -m "Release $NUEVA_VERSION"

# Crear un tag para la nueva versión (sobrescribir si ya existe)
if git rev-parse "$NUEVA_VERSION" >/dev/null 2>&1; then
  echo "El tag $NUEVA_VERSION ya existe. Sobrescribiéndolo..."
  git tag -d "$NUEVA_VERSION"
  git push origin :refs/tags/$NUEVA_VERSION
fi
git tag -a "$NUEVA_VERSION" -m "Release $NUEVA_VERSION"

# Subir los cambios y el tag al repositorio remoto
git push origin main
git push origin "$NUEVA_VERSION"
