cp .vimrc ~/.vimrc
run: ./gen_tags.sh in the source code folder

work with neovim:
sudo apt install clangd-14
sudo apt install luarocks
1. wget https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.appimage -O nvim.appimage
2. chmod +x nvim.appimage
3. sudo mv nvim.appimage /usr/local/bin/nvim
5. cp -r nvim ~/.config
6. run: cscope -Rbq


