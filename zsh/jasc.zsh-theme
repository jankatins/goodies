### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo -n "%{$fg[white]%}[%n@%m]%{$reset_color%}"
  fi
}

environment_context() {
  if [[ "$VIRTUAL_ENV" != "" || "$CONDA_DEFAULT_ENV" != "" ]]; then
    if [[ "$VIRTUAL_ENV" != "" ]] ; then
	  echo -n "%{$fg[black]%}(venv:%{$fg[green]%}$(basename $VIRTUAL_ENV)%{$fg[black]%})%{$reset_color%} "
	else
	  echo -n "%{$fg[black]%}(conda:%{$fg[green]%}$(basename $CONDA_DEFAULT_ENV)%{$fg[black]%})%{$reset_color%} "
    fi
  fi
}


PROMPT=$'%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)$(bzr_prompt_info)$(prompt_context) %{$fg[white]%}[%T]%{$reset_color%}
$(environment_context)%{$fg_bold[black]%}λ%{$reset_color%} '

PROMPT2="%{$fg_blod[black]%}%_λ %{$reset_color%}"

GIT_CB=""
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
