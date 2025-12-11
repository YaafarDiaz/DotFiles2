# DotFiles2 - Optimized Arch Linux BSPWM Setup

Configuración optimizada y refactorizada para un entorno de escritorio BSPWM en Arch Linux.

## 📦 Componentes

- **Alacritty** - Terminal emulador con tema Tokyo Night
- **BSPWM** - Window Manager tiling
- **Picom** - Compositor con transparencias y animaciones
- **Polybar** - Barra de estado personalizada
- **SXHKD** - Gestor de atajos de teclado
- **Rofi** - Lanzador de aplicaciones con iconos
- **Bibata Cursor** - Tema de cursor Material Design

## 🚀 Instalación Rápida

```bash
git clone https://github.com/TU_USUARIO/DotFiles2.git
cd DotFiles2
chmod +x install.sh
./install.sh
```

## 📋 Dependencias

Instalar las siguientes aplicaciones antes de ejecutar el script:

```bash
sudo pacman -S bspwm sxhkd polybar picom alacritty rofi feh firefox btop papirus-icon-theme
yay -S nerd-fonts-intone-mono bibata-cursor-theme
```

**O instalar cursores manualmente:**
```bash
# Descargar Bibata desde GitHub releases
curl -L -o /tmp/Bibata.tar.xz "https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata.tar.xz"
mkdir -p ~/.icons && tar -xf /tmp/Bibata.tar.xz -C ~/.icons/
```

## 🎨 Características

### Alacritty
- Tema Tokyo Night optimizado
- Fuente: IntoneMono Nerd Font
- Configuración limpia sin módulos innecesarios

### BSPWM
- Configuración para monitor único (eDP-1)
- 6 escritorios numerados
- Bordes y gaps personalizados
- Reglas de ventana por aplicación
- Esquema de colores Dracula

### Picom
- Backend xrender para mejor rendimiento
- Animaciones habilitadas
- Reglas de opacidad por aplicación
- Sin sombras para mayor rendimiento

### Polybar
- Módulos esenciales: CPU, RAM, Red, Batería
- Diseño minimalista
- Iconos Nerd Font
- Módulos separados para fácil personalización
- Power menu interactivo con rofi

### SXHKD
- Atajos intuitivos estilo Vim (hjkl)
- Configuración completa para BSPWM
- Lanzadores de aplicaciones comunes
- Rofi con estilo Windows 11 Grid

## ⌨️ Atajos Principales

| Atajo | Acción |
|-------|--------|
| `Super + Return` | Abrir Alacritty |
| `Super + Shift + C` | Copilot (escritorio 3) |
| `Super + F` | Firefox |
| `Super + W` | Cerrar ventana |
| `Super + Alt + R` | Reiniciar BSPWM |
| `Super + {h,j,k,l}` | Navegar entre ventanas |
| `Super + Shift + {h,j,k,l}` | Mover ventanas |
| `Super + {1-9}` | Cambiar de escritorio |

## 🔧 Personalización

### Cambiar número de escritorios
Edita `~/.config/bspwm/bspwmrc`:
```bash
bspc monitor eDP-1 -d 1 2 3 4 5 6  # Ajusta según necesites
```

### Cambiar wallpaper
Coloca tu wallpaper en `~/Imagenes/wall.jpg` o edita la ruta en `bspwmrc`.

### Añadir módulos a Polybar
Edita `~/.config/polybar/modules.ini` para agregar nuevos módulos personalizados.

## 📁 Estructura

```
DotFiles2/
├── alacritty/
│   └── alacritty.toml
├── bspwm/
│   ├── bspwmrc
│   └── copilot-launcher.sh
├── gtk-3.0/
│   └── settings.ini
├── picom/
│   └── picom.conf
├── polybar/
│   ├── config.ini
│   ├── modules.ini
│   └── power-menu.sh
├── rofi/
│   ├── config.rasi
│   └── themes/
│       └── windows11-grid-dark.rasi
├── sxhkd/
│   └── sxhkdrc
├── .Xresources
├── install.sh
└── README.md
```

## 🛠️ Optimizaciones Realizadas

1. **Eliminación de módulos no utilizados** (VPN, Spotify, HackTheBox)
2. **Simplificación de configuraciones de Picom** (sin sombras)
3. **Refactorización de Polybar** con módulos separados
4. **Comentarios y organización** mejorada
5. **Reducción de dependencias externas**
6. **Rofi estilo Windows 11 Grid** - Lanzador de apps estilo Windows 11

## 📝 Notas

- Este setup está optimizado para Arch Linux
- Asegúrate de tener instaladas las fuentes Nerd Fonts
- El wallpaper debe estar en `~/Imagenes/wall.jpg`
- Configurado para monitor único con 6 escritorios

## 🤝 Contribuciones

Siéntete libre de hacer fork y personalizar según tus necesidades.

## 📄 Licencia

MIT License - Usa libremente

---

**Autor:** Kayn  
**Fecha:** 2025-12-11
