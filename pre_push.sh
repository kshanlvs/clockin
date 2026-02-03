#!/bin/bash
set -e

echo "🛠️  Running pre-push checks..."

# 1️⃣ Check Flutter installation
if ! command -v flutter &> /dev/null
then
    echo "❌ Flutter not found. Please install Flutter first."
    exit 1
fi

echo "✅ Using Flutter version:"
flutter --version

# 2️⃣ Run Flutter analyze
echo "🔍 Running flutter analyze..."
flutter analyze

# 3️⃣ Run Flutter format check
echo "🖌️  Running flutter format check..."
FORMAT_DIFF=$(flutter format --set-exit-if-changed .)
if [ $? -eq 1 ]; then
    echo "❌ Code is not formatted. Run 'flutter format .' to fix."
    exit 1
fi
echo "✅ Code formatting OK."

# 4️⃣ Run tests
echo "🧪 Running tests..."
flutter test

# 5️⃣ Check AppConfig initialization
echo "🔐 Checking AppConfig initialization..."
if grep -q "AppConfig.instance" lib/main.dart; then
    echo "✅ AppConfig initialization found in main.dart"
else
    echo "❌ AppConfig.instance not found in main.dart!"
    exit 1
fi

# 6️⃣ Check for debug prints
echo "📝 Checking for debug prints..."
if grep -rn "debugPrint" lib/; then
    echo "⚠️ Found debugPrint statements. Make sure to remove them before push."
    # Optional exit if you want to block push:
    # exit 1
fi

echo "🎉 Pre-push checks passed!"
exit 0
