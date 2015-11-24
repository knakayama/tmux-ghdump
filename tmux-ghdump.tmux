#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "$0")" && pwd)"
source "${CURRENT_DIR}/scripts/helpers.sh"

readonly yrepo_key="$(get_tmux_option "@ghdump-yrepo-key" "g")"
readonly srepo_key="$(get_tmux_option "@ghdump-srepo-key" "G")"

tmux bind-key "$yrepo_key" split-window -l 10 "${CURRENT_DIR}/scripts/ghdump.sh repo"
tmux bind-key "$srepo_key" split-window -l 10 "${CURRENT_DIR}/scripts/ghdump.sh star"

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=sh sw=2 ts=2 et
