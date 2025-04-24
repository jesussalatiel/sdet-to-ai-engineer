#!/bin/bash

echo "🍏 Setting up AI Engineer environment for Mac M1/M2/M3..."

# Step 1: Check for python3.10
if ! command -v python3.10 &> /dev/null; then
    echo "❌ Python 3.10 not found. Please install it (e.g., with pyenv or Homebrew)."
    exit 1
fi

# Step 2: Create and activate virtual environment
python3.10 -m venv venv
echo "✅ Virtual environment created."

source venv/bin/activate
echo "✅ Virtual environment activated."

# Step 3: Upgrade pip
pip install --upgrade pip setuptools wheel

# Step 4: Install general AI dependencies
pip install pandas numpy matplotlib seaborn scikit-learn \
            torch torchvision opencv-python pillow \
            transformers datasets sentencepiece \
            fastapi uvicorn \
            mlflow wandb \
            pytesseract pdfplumber \
            python-dotenv jupyterlab notebook

# Step 5: TensorFlow for Apple Silicon (M1/M2/M3)
pip install tensorflow-macos
pip install tensorflow-metal

echo "✅ TensorFlow-Macos and Metal backend installed successfully!"
echo "🚀 Mac AI Engineer environment is ready to go!"
