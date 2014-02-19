My vim config scripts.

=== LINUX ===

git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
git clone https://github.com/badgeros/vim.git ~/
echo "source ~/vim/config.vim" > ~/.vimrc
vim +BundleClean! +BundleInstall! +qall
sudo apt-get install build-essential cmake python-dev
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

=== WINDOWS ===

git clone https://github.com/badgeros/vim.git C:/Users/Andrzej/vim/config.vim
 - Put this in _gvimrc and/or _vimrc:
source C:/Users/Andrzej/vim/config.vim
