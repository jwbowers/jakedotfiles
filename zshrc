## https://github.com/robbyrussell/oh-my-zsh/issues/6835#issuecomment-390216875
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH=/Users/jwbowers/.oh-my-zsh

fpath=(/usr/local/share/zsh-completions $fpath)

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
##ZSH_THEME="robbyrussell"
##ZSH_THEME="steeef"
##ZSH_THEME="zeta"
#ZSH_THEME="bullet-train"
## ZSH_THEME="refined"
## if [ -z $COLORTERM ]; then
## 	ZSH_THEME="robbyrussell"
## else
## 	# ZSH_THEME="bullet-train"
## 	ZSH_THEME="refined"
## fi
ZSH_THEME="robbyrussell"

BULLET_PROMPT_ORDER=(
context
dir
git
virtualenv
#perl
#nvm
#aws
#go
#elixir
#hg
)

BULLETTRAIN_CONTEXT_BG="default"
BULLETTRAIN_DIR_BG="default"
BULLETTRAIN_DIR_FG="default"
BULLETTRAIN_DIR_EXTENDED=0

#export BULLETTRAIN_PROMPT_ORDER=(${BULLETTRAIN_PROMPT_ORDER:#(nvm)})



# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git osx svn brew)
plugins=(brew git osx history history-substring-search terminalapp svn tmux tmuxinator github zsh-syntax-highlighting vi-mode virtualenv virtualenvwrapper)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin:/opt/X11/bin:/Library/TeX/texbin"
## export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export HOMEBREW_GITHUB_API_TOKEN="e70293b66d4b7362c661604117c42e7e175be825"

source $ZSH/oh-my-zsh.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh
export PATH="/usr/local/opt/gdal2/bin:$PATH"

HISTSIZE=50000               #How many lines of history to keep in memory
HISTFILE=~/.zsh_history     #Where to save history to disk
SAVEHIST=50000               #Number of history entries to save to disk
HISTDUP=erase               #Erase duplicates in the history file
setopt HIST_IGNORE_ALL_DUPS
setopt    appendhistory     #Append history to the history file (no overwriting)
setopt    sharehistory      #Share history across terminals
setopt    incappendhistory  #Immediately append to the history file, not just when a term is killed

#alias macvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
