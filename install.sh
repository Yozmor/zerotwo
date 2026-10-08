#!/bin/sh
# Установка zerotwo из склонированного репозитория.
# Копирует программу в ~/.local/bin и делает её запускаемой.
set -e

DIR="$(cd "$(dirname "$0")" && pwd)"
BIN="$HOME/.local/bin"

if ! command -v python3 >/dev/null 2>&1; then
    echo "Нужен python3. На Ubuntu/Debian: sudo apt install python3"
    exit 1
fi

mkdir -p "$BIN"
cp "$DIR/zerotwo" "$BIN/zerotwo"
chmod +x "$BIN/zerotwo"

echo "Готово: $BIN/zerotwo"
case ":$PATH:" in
    *":$BIN:"*) echo "Запускай командой: zerotwo" ;;
    *) echo "Папки $BIN нет в PATH. Перезапусти терминал или запусти так: $BIN/zerotwo" ;;
esac
