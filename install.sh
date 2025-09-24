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
  echo "=============================="
  read -p "Вибери опцію: " choice

  case $choice in
    1) update_system ;;
    2) install_vlc ;;
    3) show_ip ;;
    4) exit_script ;;
    *) echo "Невірний вибір. Спробуй ще раз."; sleep 2; main_menu ;;
  esac
}

# Функції
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
