gui_contacts_delete(){
    contact_id=$1
    yesno "Delete Contact?" || return 1
    output=$(call cmd_contact_delete $contact_id --force 2>&1)
    err=$?
    is_true $DEBUG && echo "$output"

    # TODO improve messages
    # TODO Think something about force
    if [[ $err == 0 ]]; then
        message info "Contact $contact_id deleted!</tt>"
    else
        fail_details=$(echo "$output" | grep '^gpg:' | uniq | pango_raw)
        message error "Failed to delete contact $contact_id.\n <tt>$fail_details</tt>" 
        return 1
    fi
}

#
# This file is part of EasyGnuPG.  EasyGnuPG is a wrapper around GnuPG
# to simplify its operations.  Copyright (C) 2018 Dashamir Hoxha,
# Divesh Uttamchandani
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