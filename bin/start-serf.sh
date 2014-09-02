#!/usr/bin/env bash
role="${SERF_ROLE:-"serf-agent"}"
exec serf agent -tag role="${role}"
