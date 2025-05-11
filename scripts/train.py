"""Train script for AI model — handles training and evaluation."""

import torch

# Check if GPU is available
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
print(f"🔥 Using device: {device}")

# Create two tensors
a = torch.tensor([2.0, 3.0], device=device)
b = torch.tensor([4.0, 5.0], device=device)

# Add the tensors
c = a + b

print("🧠 Tensor A:", a)
print("➕ Tensor B:", b)
print("✅ A + B = ", c)
