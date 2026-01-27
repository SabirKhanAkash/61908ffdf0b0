#!/bin/bash

# Make the script executable
chmod +x run_unit_tests.sh

# Run unit tests faster by skipping the pub get check
echo "🚀 Running unit tests..."
echo "----------------------------------------"

# Run tests with the expanded reporter to show individual test results
flutter test --no-pub -r expanded test/

echo "----------------------------------------"
echo "✅ Done."
