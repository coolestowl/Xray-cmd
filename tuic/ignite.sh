#!/bin/bash

#set -x

TMUX_NEW="tmux new -d"

CLASH="./clash"
CLASH_CONF="conf/clash.yaml"

TUIC="./tuic-server"
TUIC_CONF="conf/tuic-server.json"

CPROXY="./cproxy"
CLASH_PORT=`cat ${CLASH_CONF} | grep 'redir-port:' | awk '{print $2}'`

${TMUX_NEW} -s clash  -- ${CLASH} -f ${CLASH_CONF}
${TMUX_NEW} -s tuic   -- ${TUIC} -c ${TUIC_CONF}

sleep 1
TUIC_PID=`tmux list-panes -a -F "#{pane_pid} #{session_name}" | grep tuic | awk '{print $1}'`

${TMUX_NEW} -s cproxy -- ${CPROXY} --port ${CLASH_PORT} --pid ${TUIC_PID}
