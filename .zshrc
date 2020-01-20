##############################################################################
# If you come from bash you might have to change your $PATH.
export SANS_ANACONDA="/usr/local/opt/gettext/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"
##############################################################################
# Adding Julia to the system
alias julia='exec /Applications/Julia-1.0.app/Contents/Resources/julia/bin/julia'
##############################################################################
#setopt globdots # Adding suppost for hidden file and floder suggestions
setopt hist_ignore_all_dups # remove older duplicate entries from history 
setopt hist_reduce_blanks # remove superfluous blanks from history items
setopt inc_append_history # save history entries as soon as they are entered
setopt share_history # share history between different instances of the shell
setopt auto_cd # cd by typing directory name if it's not a command
setopt correct_all # autocorrect commands
setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match
##############################################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/abhisek/miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/abhisek/miniconda/etc/profile.d/conda.sh" ]; then
        . "/Users/abhisek/miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/abhisek/miniconda/bin:$SANS_ANACONDA"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
##############################################################################
# added by Anaconda3 4.4.0 installer
brew () {
  OLD_PATH="$PATH"
  export PATH="$SANS_ANACONDA"
  command brew "$@"
  export PATH="$OLD_PATH"
}
##############################################################################
##Update Function Define
update() {
  echo $'Updating Homebrew'
  OLD_PATH="$PATH"
  export PATH="$SANS_ANACONDA"

  command brew update
  command brew upgrade
  command brew cleanup

  export PATH="$OLD_PATH"
  echo $'\nUpdating Conda'
  command conda update --all -y
}
##############################################################################
##The Script To Set and Unset Proxy for all Terminal applications.
function proxy_on(){
   proxy_server_address='172.16.2.30:8080'

   export http_proxy=http://$proxy_server_address
   export https_proxy=$http_proxy
   export ftp_proxy=$http_proxy
   export socks_proxy=$http_proxy
   export ALL_PROXY=$http_proxy

   export no_proxy="10.0.0.0/8,localhost,192.168.31.1,127.0.0.1,$USERDNSDOMAIN"

   # Update git to use the proxy
   git config --global http.proxy $http_proxy
   git config --global https.proxy $https_proxy
}

# Disable proxy settings
function proxy_off(){
   variables=( \
      "http_proxy" "https_proxy" "ftp_proxy" "socks_proxy" \
      "no_proxy" )

   for i in "${variables[@]}"
   do
      unset $i
   done

   git config --global --unset http.proxy
   git config --global --unset https.proxy
}
##############################################################################
## gcc and g++ complilers
alias c++=/usr/local/bin/c++-9
alias g++=/usr/local/bin/g++-9
alias gcc=/usr/local/bin/gcc-9
alias cpp=/usr/local/bin/cpp-9
alias ld=/usr/local/bin/gcc-9
alias cc=/usr/local/bin/gcc-9
##############################################################################
# Path to your oh-my-zsh installation.
export ZSH="/Users/abhisek/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='mvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# For Showing Conda Environmet
#if [[ -n $CONDA_DEFAULT_ENV ]]; then
#    psvar[12]="$CONDA_DEFAULT_ENV"
#fi
##############################################################################
# SSH into my laptop
linussh() {
  command ssh abhisek@10.117.2.62
}

linussh2() {
  command ssh abhisek@10.117.2.210
}
##############################################################################
proxy_on
