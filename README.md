# Reset trial Jetbrains Products on Windows

This script is designed to reset the licensing and configuration files for various JetBrains IDEs on a Windows system. It removes specific directories and files related to licensing and configurations, and also cleans up certain registry entries.
## How it Works
1. **Setting up the Environment:**
    - `@echo off` is used to prevent the commands within the script from being printed to the console.
    - `SETLOCAL` is used to ensure that any environment changes made by the script are localized to the script, and do not affect the global system environment.

2. **Deleting JetBrains AppData and Registry Entry:**
    - The script checks for the existence of a JetBrains directory within the `AppData` directory.
    - If found, it deletes license files it.
    - Additionally, it deletes a specific registry entry under `HKEY_CURRENT_USER\Software\JavaSoft`.

3. **Ending the Script:**
    - `ENDLOCAL` is used to close the localized environment setup by `SETLOCAL`, returning the environment to its original state.

## Usage
Run this script in a command prompt with administrative privileges to ensure it has the necessary permissions to delete files, directories, and registry entries.