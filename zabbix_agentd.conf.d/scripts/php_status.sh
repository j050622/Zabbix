#!/bin/bash
#auther: sunday
#Date: 2018-05-27

HOST="localhost"
PORT="80"
STATUS="php_status"

[ $# -ne 1 ] && echo "USAGE:$0 (start_since|accepted_conn|listen_queue|max_listen_queue|listen_queue_len|idle_processes|active_processes|total_processes|max_active_processes|max_children_reached)" && exit 0

#检测php-fpm进程是否存在
function ping {
    /sbin/pidof php-fpm | wc -l
    }
# 检测php-fpm性能
function start_since {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null | awk '/^start since:/ {print $NF}'
    }
function accepted_conn {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null | awk '/^accepted conn:/ {print $NF}'
    }
function listen_queue {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null |awk '/^listen queue:/ {print $NF}'
    }
function max_listen_queue {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null | awk '/^max listen queue:/ {print $NF}'
    }
function listen_queue_len {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null| awk '/^listen queue len:/ {print $NF}'
    }
function idle_processes {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null|awk '/^idle processes:/ {print $NF}'
   }
function active_processes {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null| awk '/^active processes:/ {print $NF}'
   }
function max_active_processes {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null| awk '/^max active processes:/ {print $NF}'
   }
function max_children_reached {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null| awk '/^max children reached:/ {print $NF}'
   }
function slow_requests {
    /usr/bin/curl "http://$HOST:$PORT/$STATUS" 2>/dev/null| awk '/^slow requests:/ {print $NF}'
   }

#执行function
$1
