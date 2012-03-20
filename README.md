Works with Emacs 24.

# Configure user-emacs-directory

In `init.el`, set up `user-emacs-directory` variable:

    (setq user-emacs-directory "/path/to/user-emacs-directory/")

# Loading

    emacs -l /path/to/user-emacs-directory/init.el

# Git submodules

    git submodule init
    git submodule update

# Snippets

    mkdir /path/to/user-emacs-directory/my_snippets
