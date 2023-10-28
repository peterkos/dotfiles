

alias cl "osascript -e 'tell application \"System Events\" to keystroke \"k\" using command down'"
alias cls "clear && exa"
alias ls "exa"
alias lsl "ls -l --no-user --no-permissions --no-filesize --no-time"
alias lsa "ls -a"
alias lsal "ls -al"
alias c "clear"
alias tree "tree -C"
alias path "echo $PATH | tr ':' '\n' | bat"
alias fpath "echo $fish_user_paths | tr ' ' '\n' | bat"
alias rf "source ~/.config/fish/config.fish"
alias ef "$EDITOR ~/.config/fish/config.fish"
# alias dr "docker stop (docker ps -aq)  && docker rm (docker ps -a -q -f status=exited)"
alias o "open ."
alias s "sub ."
alias gs "git status"
alias gd "git diff"
alias gc "git commit"
alias ga "git add"
alias gl "git log"
alias glo "git log --oneline"
alias gb "git branch"
alias gcm "git commit -m"
alias gce "git config --edit"
alias gcge "gce --global"
alias rpc "rm -rf .parcel-cache dist"
alias ns "rpc && npm start"
alias nd "npm run dev"
alias cnd "clear && nd"
alias tower "gittower"
alias t "tower"
alias rfc "rm -rf .parcel-cache"
alias zp "zola serve"
alias zpd "zp --drafts"

alias r "railway"
alias rr "railway run"

alias spr "cd /Users/peterkos/Library/Mobile\ Documents/com~apple~CloudDocs/RIT/SPRING\ 2022 && ls"

alias db "dotnet build"
alias dr "dotnet run"
alias cdr "c && dr"
alias cdb "clear && db"

alias k "kubectl"
alias kga "kubectl get all"

alias csg "ssh -R 52698:localhost:52698 [redacted]@glados.cs.rit.edu"

alias p3 "python3"
alias daddy "sudo"

alias g "cd ~/Code/GitHub/ && c"
alias br "cd ~/Code/GitHub/brickhack.io && c"
alias bh "br"
alias he "cd ~/Code/GitHub/hackathon-manager && c"
alias hef "he && cd frontend"


# MARK: Config files
alias zconf "$EDITOR ~/.config/zellij/config.kdl"


alias cr "cargo run"
alias ccr "clear && cr"
alias cb "cargo build"
alias ccb "clear && cb"
alias cn "cargo new"
alias ct "cargo test"
alias cts "ct -- --test-threads 1"


alias h "history"
alias hg "h | grep" # bye bye zucky

# HE! Ruby!
alias bi "bundle install"

# CSCI 610 code stuff
alias cm "clear && make && ./main"

setenv EDITOR hx


# ugh.
# src: https://github.com/fish-shell/fish-shell/issues/8604
function remove_path
    if set -l index (contains -i "$argv" $fish_user_paths)
        set -e fish_user_paths[$index]
        echo "Removed $argv from the path"
    end
end

# like "bat log" for continuously monitoring a log file
function bl
    tail -f $argv | bat --paging=never -l log
end







source $HOME/.cargo/env

# https://github.com/rust-analyzer/rust-analyzer/issues/2653#issuecomment-628656084
# export CARGO="~/.cargo/bin"



# nvm
#
# this doesn't work for fish, so, DON'T USE IT!!
# insted, remember that you installed not-nvm, https://github.com/jorgebucaran/nvm.fish,
# and do *not* have node installed via brew :V)
#
  # export NVM_DIR="$HOME/.nvm"
  # [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  # [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
#
# instead, this works:
set --universal nvm_default_version latest



# fish_add_path $HOME/Downloads/omnisharp-osx-x64-net6.0/




fish_add_path $HOME/Downloads/gmakemake/bin

# music scripts. wahoo!
fish_add_path /Users/peterkos/Music/Audio/Discography/scripts
alias caa "fd -x convert_alias.sh {}"

alias wip "cd /Users/peterkos/Music/Audio/Discography/WIP\ Music"



# === Ruby

# I should need one
# fish_add_path /usr/local/opt/ruby/bin
# fish_add_path /usr/local/lib/ruby/gems/3.0.0/bin
# fish_add_path /usr/local/lib/ruby/gems/2.6.6/bin
# fish_add_path /Users/peterkos/.rbenv/versions/2.6.6/lib/ruby/2.6.0/bin
# fish_add_path $HOME/.rbenv/shims

# Uhhhhhhh.... I don't think I need these.
# export SDK_ROOT="$HOME/Desktop/MacOSX10.12.sdk"
# export SDKROOT=(xcrun --sdk macosx --show-sdk-path)
# export OPENSSL_ROOT_DIR=/usr/local/opt/openssl

# Previously needed all of these so `rbenv` could install openssl@1.1, but 
# brew was able to do it easily :)
# fish_add_path /usr/local/opt/openssl@1.1/bin
# set -gx LDFLAGS "-L/usr/local/opt/openssl@1.1/lib"
# set -gx CPPFLAGS "-I/usr/local/opt/openssl@1.1/include"
# set -gx PKG_CONFIG_PATH "/usr/local/opt/openssl@1.1/lib/pkgconfig"

# Complains unless I do it automatically...
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=(brew --prefix openssl@1.1)"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

fish_add_path /usr/local/opt/llvm/bin
set -gx LDFLAGS "-L/usr/local/opt/llvm/lib"
set -gx CPPFLAGS "-I/usr/local/opt/llvm/include"

# Init rbenv, same as `rbenv init`
status --is-interactive; and rbenv init - fish | source


# Java
export JAVA_HOME=(/usr/libexec/java_home)



function "git shove"
    git push --force
end



thefuck --alias | source





fish_add_path /Users/peterkos/.spicetify

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish




# Other scripts

# [9/24/23]
# Sets the created date of each directory
# to the date of its *oldest* contained file
#
# ```
# dir_before/
#   wow_song/ @ 1/3/20 <-----------| :^(
#       wow_song v1.wav @ 1/1/20 <-|
#       wow_song v2.wav @ 1/2/20
#
# dir_after/
#   wow_song/ @ 1/1/20 <-----------| :^)
#       wow_song v1.wav @ 1/1/20 <-|
#       wow_song v2.wav @ 1/2/20
# ```
function "datefix"

    set maxDirNameLen (math (ls -l --no-permissions --no-filesize  --no-time --no-user | awk '{ print length }' | sort -n | tail -1) + 1)


    for dir in */
        cd $dir

        set dateCur (date -r . +%D\ %I:%M\%p)
        # Get name of newest file
        set newestChild (stat -f "%m:%N" * | sort -n | head -1 | cut -f2- -d:)
        # Set modification times of parent folder to match
        touch -mr $newestChild .
        # set dateNew (date -r . +%D\ %I:%M\%p)

        if test "$dateCur" = "$dateNew"
            printf "%-"$maxDirNameLen"s | (same)\n" $dir
        else
            # printf "%-"$maxDirNameLen"s | %s -> %s\n" $dir $dateCur $dateNew
        end
        cd ../
    end
end



# Prompt

starship init fish | source


# glab

fish_add_path "/Users/peterkos/Code/GitHub/gitlab-cli/bin"



# Swift / SPM toolchain stuff

# TODO: set swift version




