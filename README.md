# yuescript-vim

Adds syntax highlighting and indent support for YueScript syntax file with extension '.yue' in vim.

## Install

### Using [Vundle](https://github.com/gmarik/vundle)

1. Add the following to your `.vimrc` where other bundles are located:
       
		Plugin 'pigpigyyy/yuescript-vim'

2. Run from command line:

		$ vim +PluginInstall +qall

### Using [pathogen](https://github.com/tpope/vim-pathogen)

1. Check out the repository into your bundle path:

        $ cd ~/.vim/bundle
        $ git clone git://github.com/pigpigyyy/yuescript-vim.git

### Normal

1. Check out the repository and copy the following to `.vim/` directory or any
   other run time path, keeping their directory structure intact:

		syntax/yue.vim
		indent/yue.vim
		ftdetect/yue.vim

## Thanks

Special thanks to the <https://github.com/leafo/moonscript-vim> project. I
copied the syntax and indent code as a starting point.
