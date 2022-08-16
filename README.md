# dotfiles : use this repository to manage home dotfiles

# collect dotfiles by stow for the first time
1. create dotfiles folder in home directory
2. create subdirectory for different applications, ex. vim, screen
3. create empty files necessary for application. ex. vim/.vimrc, screen/.screenrc
4. exectue in dotfiles folder : "stow --adopt <app>" for every application you would like to manage

