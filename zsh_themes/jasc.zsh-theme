### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    echo -n "%{$fg[white]%}[%n@%m]%{$reset_color%}"
  fi
}

environment_context() {
  if [[ "$VIRTUAL_ENV" != "" || ("$CONDA_DEFAULT_ENV" != "base" && "$CONDA_DEFAULT_ENV" != "")  ]]; then
    if [[ "$VIRTUAL_ENV" != "" ]] ; then
	  echo -n "%{$reset_color%}(venv:%{$fg[green]%}$(basename $VIRTUAL_ENV)%{$reset_color%})%{$reset_color%} "
	else
	  echo -n "%{$reset_color%}(conda:%{$fg[green]%}$(basename $CONDA_DEFAULT_ENV)%{$reset_color%})%{$reset_color%} "
    fi
  fi
}


PROMPT=$'%{$fg[blue]%}%/%{$reset_color%} $(git_prompt_info)$(bzr_prompt_info)$(prompt_context) %{$fg[white]%}[%T]%{$reset_color%}
$(environment_context)%{$bold_color%}λ%{$reset_color%} '

PROMPT2="%{$bold_color%}%λ%{$reset_color%} "

GIT_CB=""
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""