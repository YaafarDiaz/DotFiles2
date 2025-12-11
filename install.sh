#!/bin/bash

# DotFiles2 Installation Script
# Instala las configuraciones optimizadas en ~/.config

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="$HOME/.config"

echo "🚀 Instalando DotFiles2..."

# Crear backups
echo "📦 Creando backups de configuraciones existentes..."
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$BACKUP_DIR"

for dir in alacritty bspwm picom polybar sxhkd; do
    if [ -d "$CONFIG_DIR/$dir" ]; then
        echo "  → Backup: $dir"
        cp -r "$CONFIG_DIR/$dir" "$BACKUP_DIR/"
    fi
done

echo "✅ Backups guardados en: $BACKUP_DIR"

# Instalar configuraciones
echo ""
echo "📁 Instalando nuevas configuraciones..."

for dir in alacritty bspwm picom polybar sxhkd; do
    if [ -d "$SCRIPT_DIR/$dir" ]; then
        echo "  → Instalando: $dir"
        mkdir -p "$CONFIG_DIR/$dir"
        cp -r "$SCRIPT_DIR/$dir/"* "$CONFIG_DIR/$dir/"
    fi
done

# Dar permisos de ejecución a bspwmrc
echo ""
echo "🔐 Configurando permisos..."
chmod +x "$CONFIG_DIR/bspwm/bspwmrc"
chmod +x "$CONFIG_DIR/sxhkd/sxhkdrc" 2>/dev/null || true

# Verificar dependencias
echo ""
echo "🔍 Verificando dependencias..."

MISSING_DEPS=()
DEPS=(bspwm sxhkd polybar picom alacritty rofi feh)

for dep in "${DEPS[@]}"; do
    if ! command -v "$dep" &> /dev/null; then
        MISSING_DEPS+=("$dep")
    fi
done

if [ ${#MISSING_DEPS[@]} -gt 0 ]; then
    echo "⚠️  Faltan las siguientes dependencias:"
    for dep in "${MISSING_DEPS[@]}"; do
        echo "   - $dep"
    done
    echo ""
    echo "Instala con: sudo pacman -S ${MISSING_DEPS[*]}"
else
    echo "✅ Todas las dependencias están instaladas"
fi

# Verificar directorios necesarios
echo ""
echo "📂 Verificando directorios necesarios..."
mkdir -p "$HOME/Imagenes"

if [ ! -f "$HOME/Imagenes/wall.jpg" ]; then
    echo "⚠️  No se encontró wallpaper en ~/Imagenes/wall.jpg"
    echo "   Coloca tu wallpaper ahí o edita bspwmrc"
fi

echo ""
echo "✅ Instalación completada!"
echo ""
echo "📝 Próximos pasos:"
echo "   1. Cierra sesión y selecciona BSPWM en el login"
echo "   2. O ejecuta: bspc quit && bspwm"
echo ""
echo "📖 Atajos principales:"
echo "   Super + Return  → Terminal"
echo "   Super + Space   → Rofi"
echo "   Super + F       → Firefox"
echo "   Super + Alt + R → Reiniciar BSPWM"
echo ""
echo "🎨 Disfruta tu nuevo entorno!"
