#!/bin/bash

# Define IDE names
IDE_NAMES=("WebStorm" "IntelliJ" "CLion" "Rider" "GoLand" "PhpStorm" "Resharper" "PyCharm")

# Remove eval folder with license key and options.xml file
for IDE in "${IDE_NAMES[@]}"; do
    for dir in "${HOME}/.${IDE}*" ; do
        if [[ -d "$dir/config/eval" ]]; then
            rm -rf "$dir/config/eval"
            echo "Removed folder: $dir/config/eval"
        fi
        if [[ -f "$dir/config/options/other.xml" ]]; then
            rm -f "$dir/config/options/other.xml"
            echo "Removed file: $dir/config/options/other.xml"
        fi
    done
done

# Remove JetBrains folder in .config
JETBRAINS_DIR="${HOME}/.config/JetBrains"
if [[ -d "$JETBRAINS_DIR" ]]; then
    rm -rf "$JETBRAINS_DIR"
    echo "Removed folder: $JETBRAINS_DIR"
fi

# Remove JavaSoft registry key (in Linux this is not required, but you can remove Java configurations if any)
# For example, if you have a Java configuration file, you can remove it like this:
JAVA_SOFT_DIR="${HOME}/.java"
if [[ -d "$JAVA_SOFT_DIR" ]]; then
    rm -rf "$JAVA_SOFT_DIR"
    echo "Removed folder: $JAVA_SOFT_DIR"
fi

echo "Script completed."
