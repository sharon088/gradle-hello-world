#!/bin/bash

# Read the current version from build.gradle.kts (from the root directory)
VERSION=$(grep "version =" ../build.gradle.kts | awk -F '"' '{print $2}')

echo "Current version is : $VERSION"

# Split the version into parts
IFS='.' read -r MAJOR MINOR PATCH <<< "$VERSION"

# Increment the patch version
PATCH=$((PATCH + 1))

# Construct the new version
NEW_VERSION="$MAJOR.$MINOR.$PATCH"

# Replace the version in build.gradle.kts (from the root directory)
sed -i "s/version = \".*\"/version = \"$NEW_VERSION\"/" ../build.gradle.kts

echo "Version incremented to: $NEW_VERSION"
