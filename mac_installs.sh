#!/bin/bash

# Install Homebrew if not already installed
if ! command -v brew &> /dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew and formulae
brew update

# Install Python 3 and PIP 3
brew install python@3

# Upgrade PIP
pip3 install --upgrade pip

# Install Python packages
pip3 install streamlit langchain openai wikipedia chromadb tiktoken

# Verify installation
echo "Python 3, PIP 3, and required packages have been installed."
