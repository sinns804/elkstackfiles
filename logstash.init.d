#! /bin/sh
 
### BEGIN INIT INFO
# Provides:          logstash
# Short-Description: Start daemon at boot time
# Description:       Enable service provided by daemon.
### END INIT INFO


. /lib/lsb/init-functions

name="logstash"
logstash_bin="/opt/logstash/bin/logstash"
logstash_conf="/etc/logstash/$name.conf"
logstash_log="/var/log/$name.log"
pid_file="/var/run/$name.pid"

start () {
   command="${logstash_bin} -- agent -f $logstash_conf –l ${logstash_log}" 
echo ${command}

        log_daemon_msg "Starting $name" "$name"
        if start-stop-daemon --start --quiet --oknodo --pidfile "$pid_file" -b -m --exec $command; then
                log_end_msg 0
        else
                log_end_msg 1
        fi
}

stop () {
        log_daemon_msg "Stopping $name" "$name"
        start-stop-daemon --stop --quiet --oknodo --pidfile "$pid_file"
}

status () {
        status_of_proc -p $pid_file "" "$name"
}

case $1 in
        start)
                if status; then exit 0; fi
                start
                ;;
        stop)
                stop
                ;;
        reload)
                stop
                start
                ;;
        restart)
                stop
                start
                ;;
        status)
                status && exit 0 || exit $?
                ;;
        *)
                echo "Usage: $0 {start|stop|restart|reload|status}"
                exit 1
                ;;
esac

exit 0
