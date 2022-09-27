#!/usr/bin/env bash

setar -xpvzf .tar.gz
# ↑ Pay attention to the user who made the tarfile you want to extract. If you had to "sudo" to make it, then it is owned by "root", and you need to "sudo" to extract it - otherwise "tar" will inadvertently make your current user the owner of all of the files, ruining the permissions in the process!
echo -e "$(basename -- "$0") exited with code=\033[0;32m$?\033[0;31m"