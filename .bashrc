
# Colorize the Terminal from http://www.byteengine.net/custom-colors-in-snow-leopard-terminal-64-bit
## export CLICOLOR=1;
## test -r /sw/bin/init.sh && . /sw/bin/init.sh
##R_HOME=/Library/Frameworks/R.framework/Resources; export R_HOME
PATH="/usr/local/Cellar/ruby193/1.9.3-p545:/usr/local/bin/appengine-java-sdk-1.6.4/bin:/usr/local/bin:/usr/texbin:/Applications/Stata/StataSE.app/Contents/MacOS:/usr/local/opt/ruby/bin:${PATH}"
# Setting PATH for Python 2.7
# The orginal version is saved in .profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
##export TERM=xterm
set -o vi
## export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PYTHONPATH=/usr/local/lib/python2.7/site-packages
export GDAL_DRIVER_PATH=/usr/local/lib/gdalplugins

##To enable shims and autocompletion add to your profile:
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

##  To use Homebrew's directories rather than ~/.rbenv add to your profile:
export RBENV_ROOT=/usr/local/var/rbenv

# Setup Amazon EC2 Command-Line Tools
# export EC2_HOME=~/.ec2
# export PATH=$PATH:$EC2_HOME/bin
# export EC2_PRIVATE_KEY=`ls $EC2_HOME/pk-*.pem`
## export EC2_CERT=`ls $EC2_HOME/cert-*.pem`
## export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/
## export JAVA_HOME='/usr/libexec/java_home'

export JAVA_HOME="$(/usr/libexec/java_home)"
#export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
#export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
#export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"

## [[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
# 
# # Save and reload the history after each command finishes
## export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
## export PROMPT_COMMAND="update_terminal_cwd $PROMPT_COMMAND"

export CPLEX_DIR=~/Applications/IBM/ILOG/CPLEX_Studio125/cplex
export CPLEX_LIB_PATH=~/Applications/IBM/ILOG/CPLEX_Studio125/cplex/lib/x86-64_darwin
export CPLEX=~/Applications/IBM/ILOG/CPLEX_Studio125
export CPLEX_BIN=~/Applications/IBM/ILOG/CPLEX_Studio125/cplex/bin/x86-64_darwin/cplex
export CPLEX_INCLUDE_PATH=~/Applications/IBM/ILOG/CPLEX_Studio125/cplex/include



# source /Users/jwbowers/Documents/PROJECTS/SRC/StarCluster/completion/starcluster-completion.sh
