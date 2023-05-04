#!/bin/bash

# Install Homebrew if not already installed
echo -e "\nChecking if Homebrew is already installed..."
if ! command -v brew &> /dev/null; then
    echo -e "\nInstalling Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew and formulae
echo -e "\nUpdating Homebrew & Formulae"
brew update

# Install Python 3 and PIP 3
echo -e "\nInstalling Python 3 & PIP 3.."
brew install python@3

# Upgrade PIP
echo -e "\nUpdating PIP 3..."
pip3 install --upgrade pip

# Install Python packages
echo -e "\nInstalling AutoGPT dependencies..."
pip3 install streamlit langchain openai wikipedia chromadb tiktoken

# Verify installation
echo -e "\nPython 3, PIP 3, and required packages have been installed."
