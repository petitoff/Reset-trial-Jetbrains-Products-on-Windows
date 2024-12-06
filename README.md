# Reset JetBrains Trial on Windows
This script safely resets the trial state for JetBrains IDEs on Windows while preserving user configurations and settings. It removes only specific licensing-related files and registry entries.

## How it Works
1. **Administrative Check:**
    - The script verifies if it has administrative privileges
    - If not running as admin, it prompts the user to run as administrator

2. **Cleaning License Data:**
    - Removes specific licensing-related files from `%APPDATA%\JetBrains`:
        - `PermanentUserId`
        - `PermanentDeviceId`
        - Trial-related key files (`*.key`)
        - License files (`*.license`)
        - Blacklist data (`bl`)
        - Certificate revocation lists (`crl`)
    - Cleans up JavaSoft registry entries

3. **Preservation of Settings:**
    - Maintains all user configurations, preferences, and project settings
    - Keeps IDE customizations intact
    - Preserves installed plugins and their settings

## Usage
1. Save the script with a `.bat` extension
2. Right-click the script and select "Run as administrator"
3. Allow the script to complete its execution

## Notes
- User configurations and IDE settings remain untouched
- Only licensing-related files are affected
- Requires administrative privileges to modify registry entries
- For proper development work, consider using licensed versions of JetBrains products

## Warning
This script modifies system files and registry entries related to JetBrains products. Always ensure you understand the implications of running such scripts and have backups of important data. Using JetBrains products should comply with their terms of service.