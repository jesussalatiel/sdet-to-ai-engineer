#!/bin/bash

echo "🍏 Setting up AI Engineer environment for Mac M1/M2/M3..."

# Step 1: Check for Python 3.10
PYTHON_PATH="/opt/homebrew/bin/python3.10"
if [ ! -f "$PYTHON_PATH" ]; then
  echo "❌ Python 3.10 not found at $PYTHON_PATH"
  echo "👉 Install it with Homebrew: brew install python@3.10"
  exit 1
fi

# Step 2: Create and activate virtual environment
$PYTHON_PATH -m venv venv
echo "✅ Virtual environment created."

source venv/bin/activate
echo "✅ Virtual environment activated."

# Step 3: Upgrade pip and setuptools
pip install --upgrade pip setuptools wheel

# Step 4: Install AI and Dev dependencies
pip install \
    pandas numpy matplotlib seaborn scikit-learn \
    torch torchvision opencv-python pillow \
    transformers datasets sentencepiece \
    fastapi uvicorn \
    mlflow wandb \
    pytesseract pdfplumber \
    python-dotenv jupyterlab notebook \
    pre-commit pylint black gitlint

# Step 5: Install TensorFlow for Apple Silicon (M1/M2/M3)
pip install tensorflow-macos tensorflow-metal

# Step 6: Setup pre-commit hooks
if [ -f ".pre-commit-config.yaml" ]; then
    echo "🛠 Installing pre-commit hooks..."
    pre-commit install
    pre-commit install --hook-type commit-msg
    echo "✅ Pre-commit hooks installed."
else
    echo "⚠️ .pre-commit-config.yaml not found. Skipping hook setup."
fi

echo "🚀 Setup complete! You're ready to build as an AI Engineer."