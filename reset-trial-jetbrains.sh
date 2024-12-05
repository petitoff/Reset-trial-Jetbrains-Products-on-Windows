#!/bin/bash

# Определяем имена IDE
IDE_NAMES=("WebStorm" "IntelliJ" "CLion" "Rider" "GoLand" "PhpStorm" "Resharper" "PyCharm")

# Удаляем папку eval с лицензионным ключом и файлом options.xml
for IDE in "${IDE_NAMES[@]}"; do
    for dir in "${HOME}/.${IDE}*" ; do
        if [[ -d "$dir/config/eval" ]]; then
            rm -rf "$dir/config/eval"
            echo "Удалена папка: $dir/config/eval"
        fi
        if [[ -f "$dir/config/options/other.xml" ]]; then
            rm -f "$dir/config/options/other.xml"
            echo "Удален файл: $dir/config/options/other.xml"
        fi
    done
done

# Удаляем папку JetBrains в .config
JETBRAINS_DIR="${HOME}/.config/JetBrains"
if [[ -d "$JETBRAINS_DIR" ]]; then
    rm -rf "$JETBRAINS_DIR"
    echo "Удалена папка: $JETBRAINS_DIR"
fi

# Удаляем ключ реестра JavaSoft (в Linux это не требуется, но можно удалить конфигурации Java, если есть)
# Например, если у вас есть файл конфигурации Java, вы можете удалить его так:
JAVA_SOFT_DIR="${HOME}/.java"
if [[ -d "$JAVA_SOFT_DIR" ]]; then
    rm -rf "$JAVA_SOFT_DIR"
    echo "Удалена папка: $JAVA_SOFT_DIR"
fi

echo "Скрипт завершен."
