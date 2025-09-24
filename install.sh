#!/bin/bash

# Назва скрипта та стилізація
SCRIPT_NAME="🧃 UzvarUA Starter Menu"
VERSION="v1.0"

# Кольори
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Головне меню
main_menu() {
  clear
  echo -e "${GREEN}$SCRIPT_NAME — $VERSION${NC}"
  echo "=============================="
  echo "1. Оновити систему"
  echo "2. Встановити VLC"
  echo "3. Перевірити IP-адресу"
  echo "4. Вийти"
  echo "5. Встановлення pulseaudio"
  echo "6. Встановлення flatpack"
  echo "7. Встановлення Bottles"
  echo "8. Встановлення Telegram"
  echo "=============================="
  read -p "Вибери опцію: " choice

  case $choice in
    1) update_system ;;
    2) install_vlc ;;
    3) show_ip ;;
    4) exit_script ;;
    5) install_pulseaudio ;;
    6) install_flatpack ;;
    7) install_bottles ;;
    8) install_telegram ;;
    *) echo "Невірний вибір. Спробуй ще раз."; sleep 2; main_menu ;;
  esac
}

# Функції
install_telegram() {
  echo "Встановлення Telegram"
  flatpak install flathub org.telegram.desktop
  pause_return
}

install_bottles(){
  echo "Встановлення bottles"
  flatpak install flathub com.usebottles.bottles
  pause_return
}

install_flatpak() {
  echo "Встановлення flatpak"
  sudo apt install flatpak
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
  echo "Перезавантажте систему (опціонально)"
  pause_return
}

install_pulseaudio() {
  echo "Встановлення pulseaudio"
  sudo apt install pulseaudio -y
  pause_return
}

update_system() {
  echo "🔄 Оновлення системи..."
  sudo apt update && sudo apt upgrade -y
  pause_return
}

install_vlc() {
  echo "📦 Встановлення VLC..."
  sudo apt install vlc -y
  pause_return
}

show_ip() {
  echo "🌐 Твоя IP-адреса:"
  ip a | grep inet | grep -v inet6
  pause_return
}

exit_script() {
  echo "👋 До зустрічі!"
  exit 0
}

pause_return() {
  read -p "Натисни Enter, щоб повернутись до меню..."
  main_menu
}

# Запуск
main_menu
