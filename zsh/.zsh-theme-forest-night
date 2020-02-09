# This theme is forest-night version of purepower(powerlevel10k)
# Upstream: https://github.com/romkatv/dotfiles-public/blob/master/.purepower

# PURE_POWER_MODE=modern    use nerdfont characters in the prompt
# PURE_POWER_MODE=fancy     use unicode characters in the prompt
# PURE_POWER_MODE=portable  use only ascii characters in the prompt
PURE_POWER_MODE=modern

if autoload -U is-at-least && is-at-least 5.7 && [[ $COLORTERM == (24bit|truecolor) || ${terminfo[colors]} -eq 16777216 ]]; then
    DESERT_NIGHT_PURE_POWER_TRUE_COLOR=true
else
    DESERT_NIGHT_PURE_POWER_TRUE_COLOR=false
fi

if test -z "${ZSH_VERSION}"; then
  echo "purepower: unsupported shell; try zsh instead" >&2
  return 1
  exit 1
fi

() {
  emulate -L zsh && setopt no_unset pipe_fail

  # `$(_pp_c x y`) evaluates to `y` if the terminal supports >= 256 colors and to `x` otherwise.
  zmodload zsh/terminfo
  if (( terminfo[colors] >= 256 )); then
    function _pp_c() { print -nr -- $2 }
  else
    function _pp_c() { print -nr -- $1 }
    typeset -g POWERLEVEL9K_IGNORE_TERM_COLORS=true
  fi

  # `$(_pp_s x y`) evaluates to `x` in portable mode and to `y` in fancy mode.
  if [[ ${PURE_POWER_MODE:-fancy} == fancy || $PURE_POWER_MODE == modern ]]; then
    function _pp_s() { print -nr -- $2 }
  else
    if [[ $PURE_POWER_MODE != portable ]]; then
      echo -En "purepower: invalid mode: ${(qq)PURE_POWER_MODE}; " >&2
      echo -E  "valid options are 'modern', 'fancy' and 'portable'; falling back to 'portable'" >&2
    fi
    function _pp_s() { print -nr -- $1 }
  fi

  typeset -ga POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      dir vcs)

  typeset -ga POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      status command_execution_time background_jobs custom_rprompt context)

  local ins=$(_pp_s '>' '❯')
  local cmd=$(_pp_s '<' '❮')
  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    local p="\${\${\${KEYMAP:-0}:#vicmd}:+${${ins//\\/\\\\}//\}/\\\}}}"
    p+="\${\${\$((!\${#\${KEYMAP:-0}:#vicmd})):#0}:+${${cmd//\\/\\\\}//\}/\\\}}}"
  else
    p=$ins
  fi
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    local ok="%F{#d8cbb2}${p}%f"
    local err="%F{#e3888a}${p}%f"
  else
    local ok="%F{$(_pp_s 007 223)}${p}%f"
    local err="%F{$(_pp_s 001 167)}${p}%f"
  fi

  if (( ${PURE_POWER_USE_P10K_EXTENSIONS:-1} )); then
    typeset -g POWERLEVEL9K_SHOW_RULER=true
    typeset -g POWERLEVEL9K_RULER_CHAR=$(_pp_s '-' '─')
    typeset -g POWERLEVEL9K_RULER_BACKGROUND=none
    if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
      typeset -g POWERLEVEL9K_RULER_FOREGROUND='#576268'
    else
      typeset -g POWERLEVEL9K_RULER_FOREGROUND=$(_pp_c 7 241)
    fi
  else
    typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
    function custom_rprompt() { }
  fi

  typeset -g POWERLEVEL9K_LEFT_SEGMENT_END_SEPARATOR=
  typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
  typeset -g POWERLEVEL9K_RPROMPT_ON_NEWLINE=false
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%(?.$ok.$err) "

  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_{LEFT,RIGHT}_SEGMENTS=

  typeset -g POWERLEVEL9K_DIR_{ETC,HOME,HOME_SUBFOLDER,DEFAULT,NOT_WRITABLE}_BACKGROUND=none
  typeset -g POWERLEVEL9K_{ETC,FOLDER,HOME,HOME_SUB}_ICON=
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_COLOR='#e3a184'
  else
    typeset -g POWERLEVEL9K_DIR_WRITABLE_FORBIDDEN_VISUAL_IDENTIFIER_COLOR=$(_pp_c 003 208)
  fi
  if [[ "$PURE_POWER_MODE" == "modern" ]]; then
    typeset -g POWERLEVEL9K_LOCK_ICON=''
  else
    typeset -g POWERLEVEL9K_LOCK_ICON=
  fi
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    typeset -g POWERLEVEL9K_DIR_{ETC,DEFAULT}_FOREGROUND='#8fc09b'
    typeset -g POWERLEVEL9K_DIR_{HOME,HOME_SUBFOLDER}_FOREGROUND='#a7bf81'
    typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='#e3888a'
  else
    typeset -g POWERLEVEL9K_DIR_{ETC,DEFAULT}_FOREGROUND=$(_pp_c 006 108)
    typeset -g POWERLEVEL9K_DIR_{HOME,HOME_SUBFOLDER}_FOREGROUND=$(_pp_c 010 142)
    typeset -g POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND=$(_pp_c 009 167)
  fi

  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND=none
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED}_MAX_NUM=99
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='#91bebb'
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='#d9bd87'
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='#d3a5be'
    typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND='#868d80'
  else
    typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$(_pp_c 004 109)
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$(_pp_c 011 214)
    typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$(_pp_c 005 175)
    typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=$(_pp_c 007 245)
  fi
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNTRACKEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_UNSTAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STAGEDFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_MODIFIED_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_INCOMING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_OUTGOING_CHANGESFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_STASHFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_CLEAN_FOREGROUND
  typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED}_ACTIONFORMAT_FOREGROUND=001
  typeset -g POWERLEVEL9K_VCS_LOADING_ACTIONFORMAT_FOREGROUND=$POWERLEVEL9K_VCS_LOADING_FOREGROUND
  if [[ "$PURE_POWER_MODE" == "modern" ]]; then
    typeset -g POWERLEVEL9K_VCS_GIT_ICON=''
    typeset -g POWERLEVEL9K_VCS_GIT_GITHUB_ICON=''
    typeset -g POWERLEVEL9K_VCS_GIT_GITLAB_ICON=''
    typeset -g POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON=''
    typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=' '
    typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=' '
    typeset -g POWERLEVEL9K_VCS_COMMIT_ICON=' '
    typeset -g POWERLEVEL9K_VCS_STAGED_ICON=' '
    typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=' '
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='✩'
    typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='⇣'
    typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='⇡'
    typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
    typeset -g POWERLEVEL9K_VCS_TAG_ICON=' '
  else
    typeset -g POWERLEVEL9K_VCS_{GIT,GIT_GITHUB,GIT_BITBUCKET,GIT_GITLAB,BRANCH}_ICON=
    typeset -g POWERLEVEL9K_VCS_REMOTE_BRANCH_ICON=$'%{\b|%}'
    typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
    typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
    typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='!'
    typeset -g POWERLEVEL9K_VCS_STAGED_ICON='+'
    typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=$(_pp_s '<' '⇣')
    typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=$(_pp_s '>' '⇡')
    typeset -g POWERLEVEL9K_VCS_STASH_ICON='*'
    typeset -g POWERLEVEL9K_VCS_TAG_ICON=$'%{\b#%}'
  fi

  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_BACKGROUND=none
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND='#e3888a'
  else
    typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$(_pp_c 001 167)
  fi
  typeset -g POWERLEVEL9K_CARRIAGE_RETURN_ICON=

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=none
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND='#868d80'
  else
    typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$(_pp_c 008 246)
  fi
  typeset -g POWERLEVEL9K_EXECUTION_TIME_ICON=

  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,ROOT,REMOTE_SUDO,REMOTE,SUDO}_BACKGROUND=none
  if [[ "$DESERT_NIGHT_PURE_POWER_TRUE_COLOR" == "true" ]]; then
    typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,REMOTE_SUDO,REMOTE,SUDO}_FOREGROUND='#e3a184'
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND='#e3888a'
  else
    typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,REMOTE_SUDO,REMOTE,SUDO}_FOREGROUND=$(_pp_c 003 208)
    typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$(_pp_c 001 167)
  fi

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=none
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VISUAL_IDENTIFIER_COLOR=2
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_ICON=$(_pp_s '%%' '⇶')

  # typeset -g POWERLEVEL9K_CUSTOM_RPROMPT=custom_rprompt
  # typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_BACKGROUND=none
  # typeset -g POWERLEVEL9K_CUSTOM_RPROMPT_FOREGROUND=$(_pp_c 4 12)

  unfunction _pp_c _pp_s
} "$@"
