#!/bin/bash

# Make the script executable
chmod +x build_runner.sh

# Code generation script for Freezed and JSON Serializable

echo "🧹 Cleaning old generated files..."
flutter pub run build_runner clean

echo "🔨 Running code generation..."
flutter pub run build_runner build --delete-conflicting-outputs

echo "✅ Code generation complete!"