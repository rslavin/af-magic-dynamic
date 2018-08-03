# af-magic-dynamic.zsh-theme
# Repo: https://github.com/rslavin/af-magic-dynamic
# Forked From: https://github.com/andyfleming/oh-my-zsh/blob/master/themes/af-magic.zsh-theme

if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

# set pdir so it only tests once
# can set ENABLE_SHRINK_PROMPT to false to disable use of shrink-path plugin (increases performance)
if [[ ${ENABLE_SHRINK_PROMPT} = "true" ]] && [[ " ${plugins[@]} " =~ .*shrink-path.* ]];
then
    pdir=true
else
    pdir=false
fi

# set minimum width. can be set in .zshrc with MIN_PROMPT_WHITESPACE
if ! [[ ${MIN_PROMPT_WHITESPACE} ]];
then
    MIN_PROMPT_WHITESPACE=60
fi

# primary prompt
PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
$(prompt_dir) \
$(git_prompt_info) \
$FG[105]%(!.#.»)%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'


# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'

# right prompt
if type "virtualenv_prompt_info" > /dev/null
then
        RPROMPT='$(virtualenv_prompt_info)$my_gray%n@%m%{$reset_color%}%'
else
        RPROMPT='$my_gray%n@%m%{$reset_color%}%'
fi

prompt_dir() {
    if $pdir;
    then
        echo "$FG[032]%-${MIN_PROMPT_WHITESPACE}<...<$(shrink_path -f)%<<"
    else
        echo "$FG[032]%-${MIN_PROMPT_WHITESPACE}<...<%~%<<"
    fi
}

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075]($FG[078]"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
