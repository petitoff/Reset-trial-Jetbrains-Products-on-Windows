# Reset trial Jetbrains Products on Windows

This script is designed to reset the licensing and configuration files for various JetBrains IDEs on a Windows system. It removes specific directories and files related to licensing and configurations, and also cleans up certain registry entries.
## How it Works
1. **Setting up the Environment:**
    - `@echo off` is used to prevent the commands within the script from being printed to the console.
    - `SETLOCAL` is used to ensure that any environment changes made by the script are localized to the script, and do not affect the global system environment.

2. **Defining Target IDEs:**
    - A list of IDE names is defined under the variable `IDE_NAMES`.

3. **Deleting Evaluation Folders and Configuration Files:**
    - The script iterates through each IDE name defined in `IDE_NAMES`.
    - For each IDE, it iterates through directories within the user's profile directory that match the IDE name pattern.
    - It checks for the existence of the `eval` directory and `other.xml` file under the `config` directory of each found IDE directory.
    - If found, it deletes the `eval` directory and `other.xml` file, which are assumed to contain licensing and configuration information respectively.

4. **Deleting JetBrains AppData and Registry Entry:**
    - The script checks for the existence of a JetBrains directory within the `AppData` directory.
    - If found, it deletes the entire JetBrains directory.
    - Additionally, it deletes a specific registry entry under `HKEY_CURRENT_USER\Software\JavaSoft`.

5. **Ending the Script:**
    - `ENDLOCAL` is used to close the localized environment setup by `SETLOCAL`, returning the environment to its original state.

## Usage
Run this script in a command prompt with administrative privileges to ensure it has the necessary permissions to delete files, directories, and registry entries.

## Warning
Executing this script can significantly alter the configuration of your JetBrains IDEs. It essentially removes local records, making the system behave as if the IDEs are being installed anew or as if system data was being restored. However, be aware that running this script may violate the terms of service of the JetBrains software. It's crucial to understand the implications of running this script and to ensure you have backups of any important data.
