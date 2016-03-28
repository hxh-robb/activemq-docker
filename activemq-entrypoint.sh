#!/bin/bash
set -e

run_activemq() {
    chown -R activemq:activemq $ACTIVEMQ_BASE

    exec gosu activemq /usr/local/bin/activemq ${@:-console}
}

case "$1" in
    activemq)
        shift 1
        run_activemq "$@"
        ;;
    *)
        exec "$@"
esac
