#!/usr/bin/env bash

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value=$(tmux show-option -gqv "$option")

  if [[ -z $option_value ]]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

get_cmd() {
  case "$OSTYPE" in
    darwin*)
      echo "open"
      ;;
    linux*)
      echo "xdg-open"
      ;;
  esac
}

display_msg() {
  local message="$1"

  # display_duration defaults to 5 seconds, if not passed as an argument
  if [ "$#" -eq 2 ]; then
    local display_duration="$2"
  else
    local display_duration="5000"
  fi

  # saves user-set 'display-time' option
  local saved_display_time=$(get_tmux_option "display-time" "750")

  # sets message display time to 5 seconds
  tmux set-option -gq display-time "$display_duration"

  # displays message
  tmux display-message "$message"

  # restores original 'display-time' value
  tmux set-option -gq display-time "$saved_display_time"
}

set_token() {
  local gh_user gh_token
  local prefix="$(uname -n)"

  IFS= read -p "Enter user name for github.com: " -r gh_user

  gh_token="$(curl \
    --silent \
    --user "$gh_user" \
    --data "{\"scopes\":[\"repo\"],\"note\":\"tmux-ghdump on $prefix\"}" \
    "https://api.github.com/authorizations" \
    | jq '.token')"

  echo "{\"user\":\"$gh_user\",\"oauth_access_token\":$gh_token}" \
    | jq --monochrome-output '.' > "${HOME}/.ghdump.json"
}

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
