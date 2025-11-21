#!/bin/bash
# install.sh - Script di installazione automatica dei dotfiles Arch + Hyprland

echo "🔧 Installazione dei dotfiles tramite GNU Stow..."

# Controllo se stow è installato
if ! command -v stow &>/dev/null; then
  echo "❌ GNU Stow non è installato. Installa con:"
  echo "sudo pacman -S stow"
  exit 1
fi

# Lista dei moduli da stoware
MODULES=(
  hypr
  waybar
  wofi
  hyprpaper
  hypridle
  hyprlock
  kitty
  swaync
  starship
  fastfetch
  nvim
  scripts
  backgrounds
)

# Stow dei moduli
for module in "${MODULES[@]}"; do
  if [ -d "$module" ]; then
    echo "➡️  Stow $module"
    stow "$module"
  else
    echo "⚠️  Cartella $module non trovata, salto..."
  fi
done

# Gestione SDDM (richiede sudo)
if [ -d "sddm" ]; then
  echo "➡️  Stow SDDM (richiede sudo)"
  sudo stow -t / sddm
else
  echo "⚠️  Cartella SDDM non trovata, salto..."
fi

echo "🎉 Installazione completata!"
