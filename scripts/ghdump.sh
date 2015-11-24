#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
GHDUMP_CREDENTIAL="${HOME}/.ghdump.json"

source "${CURRENT_DIR}/helpers.sh"

ARG="$1"
CMD="$(get_cmd)"

for i in "ghdump" "peco"; do
  if ! type "$i" >/dev/null 2>&1; then
    display_msg "Can't find $i in your \$PATH."
    return 1
  fi
done

[[ -f "$GHDUMP_CREDENTIAL" ]] || set_token

repo="$(ghdump "$ARG" \
  | peco \
  | awk '{print $1}')"

[[ -n "$repo" ]] && "$CMD" "$repo"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
