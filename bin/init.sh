#!/usr/bin/env bash
exec supervisord -n -c /etc/supervisor/supervisord.conf
