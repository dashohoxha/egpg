# Download contact from the keyserver network.

cmd_contact_receive_help() {
    cat <<-_EOF
    receive,pull <contact-id> [-s,--keyserver <server>]
        Download contact from the keyserver network.

_EOF
}

cmd_contact_receive() {
    local opts keyserver="$KEYSERVER"
    opts="$(getopt -o s: -l keyserver: -n "$PROGRAM" -- "$@")"
    local err=$?
    eval set -- "$opts"
    while true; do
        case $1 in
            -s|--keyserver) keyserver="$2"; shift 2 ;;
            --) shift; break ;;
        esac
    done
    [[ $err != 0 ]] && fail "Usage:\n$(cmd_contact_receive_help)"
    [[ -z $1 ]] && fail "Usage:\n$(cmd_contact_receive_help)"

    gpg --keyserver "$keyserver" --recv-keys "$@"
}

#
# This file is part of EasyGnuPG.  EasyGnuPG is a wrapper around GnuPG
# to simplify its operations.  Copyright (C) 2016 Dashamir Hoxha
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/
#
