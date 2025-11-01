#!/bin/bash
set -e

echo "Checking dependencies..."

if ! command -v ctags &> /dev/null; then
    echo " Installing Universal Ctags..."
    sudo apt update
    sudo apt install -y universal-ctags || sudo apt install -y exuberant-ctags
else
    echo "ctags found: $(ctags --version | head -n 1)"
fi

if ! command -v cscope &> /dev/null; then
    echo "Installing cscope..."
    sudo apt install -y cscope
else
    echo "cscope found: $(cscope --version | head -n 1)"
fi

echo "Cleaning old databases..."
rm -f tags cscope.* cscope.files

echo "Scanning source files..."
find . -type f \( -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \) > cscope.files

if [ ! -s cscope.files ]; then
    echo "No source files found!"
    exit 1
fi

echo "Generating ctags..."
ctags -R --languages=c,c++ --fields=+l --extras=+q

echo "Generating cscope database..."
cscope -b -q -k -i cscope.files

echo "Done! You can now use Vim with cscope + ctags navigation."
