# DeepdotsSDK-SPM

## Overview
DeepdotsSDK-SPM is a Swift Package Manager (SPM) compatible SDK for integrating Deepdots functionality into your iOS projects.

## Installation

To integrate DeepdotsSDK-SPM into your project, follow these steps:

1. Open your Xcode project.
2. Go to `File > Add Packages`.
3. Enter the repository URL: `https://github.com/MagicFeedback/DeepdotsSDK-SPM`.
4. Select the version you want to install.
5. Add the package to your project.

## Managing Releases

### Uploading a New Version

To upload a new version of the SDK, use the provided script `update_version.sh`. This script automates the process of updating the `Package.swift` file, uploading the `.xcframework.zip` file, and creating a Git tag.

#### Steps:
1. Ensure the `.xcframework.zip` file is generated and located in the appropriate directory.
2. Run the script:
   ```bash
   ./update_version.sh
   ```
3. The script will:
   - Update the `Package.swift` file with the new version, URL, and checksum.
   - Commit the changes.
   - Create or overwrite the Git tag for the new version.
   - Push the changes and tag to the remote repository.

### Overwriting an Existing Version

If you need to overwrite an existing version:
1. Run the script with the same version number.
2. The script will delete the existing tag and recreate it with the updated files.

## Notes
- Ensure you have write access to the repository before running the script.
- The script assumes the `.xcframework.zip` file is correctly named and located in the specified path.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
