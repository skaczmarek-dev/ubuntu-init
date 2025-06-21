#!/bin/bash

CRON_JOB="@reboot sleep 10 && /root/ubuntu_init/ubuntu_init.sh"

install_dependencies() {
    apt update
    apt install rsync iputils-ping cron vim
}

ami_root() {
    if [ "$(id -u)" -ne 0 ]; then
        log_message "ERROR" "You need to be root!"
        return 1
    fi

    return 0
}

crontab_add() {
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
}

main() {
    if ! ami_root; then
        exit 1
    fi

    install_dependencies
    crontab_add
}

main