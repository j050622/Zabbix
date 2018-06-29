#!/bin/bash
#Author: sunday
#Date: 2018-06-17
#Description: monitor redis status
#!/bin/bash

R_COMMAND="$1"
R_CLI="/usr/local/webserver/redis/bin/redis-cli"
R_PORT="6379"  #根据实际情况调整端口
R_HOST="127.0.0.1"  #根据具体情况调整IP地址
PASSWD="u31K+e07GyJ4gvYw+Rx5V4=/m6Tfyq+Q="    #如果没有设置Redis密码,为空即可

[ $# -ne 1 ] && echo "$0 Usage:(use_cpu_sys|used_cpu_user|used_cpu_sys_children|used_cpu_user_children|.....)" && exit 0

REDIS_INFO(){
   $R_CLI -h $R_HOST -p $R_PORT -a $PASSWD info
}
case $R_COMMAND in
# Server
    uptime_in_seconds)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    uptime_in_days)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    lru_clock)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
# Clients
    connected_clients)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    client_longest_output_list)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    client_biggest_input_buf)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    blocked_clients)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
# Memory
    used_memory)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}' | awk 'NR==1'
    ;;
    used_memory_rss)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F':' '{print $NF}' 
    ;;
    used_memory_peak)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    used_memory_lua)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    mem_fragmentation_ratio)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
# RDB
    rdb_changes_since_last_save)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    rdb_bgsave_in_progress)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    rdb_last_save_time)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    rdb_last_bgsave_status)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}' | grep -c ok
    ;;
    rdb_last_bgsave_time_sec)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    rdb_current_bgsave_time_sec)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
# AOF
    aof_enabled)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    aof_rewrite_in_progress)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    aof_rewrite_scheduled)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    aof_last_rewrite_time_sec)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    aof_current_rewrite_time_sec)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    aof_last_bgrewrite_status)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}' | grep -c ok
    ;;
    aof_last_write_status)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}' | grep -c ok
    ;;
# Stats
    total_connections_received)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    total_commands_processed)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    instantaneous_ops_per_sec)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    total_net_input_bytes)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    total_net_output_bytes)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    instantaneous_input_kbps)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    instantaneous_output_kbps)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    rejected_connections)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    sync_full)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    sync_partial_ok)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    sync_partial_err)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    expired_keys)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    evicted_keys)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    keyspace_hits)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    keyspace_misses)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    pubsub_channels)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    pubsub_patterns)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    latest_fork_usec)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    migrate_cached_sockets)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
# Replication
    repl_role)
    REDIS_INFO | grep "role" | awk -F':' '{print $NF}' | grep -c 'master'
    ;;
    repl_connected_slaves)
    REDIS_INFO | grep "connected_slaves" | awk -F':' '{print $NF}'
    ;;
    repl_master_repl_offset)
    REDIS_INFO | grep "master_repl_offset" | awk -F':' '{print $NF}'
    ;;
    repl_backlog_active)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    repl_backlog_size)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    repl_backlog_first_byte_offset)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
    repl_backlog_histlen)
    REDIS_INFO | grep "$R_COMMAND" | awk -F':' '{print $NF}'
    ;;
# KeySpace
    keys)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F'=|,' '{print $2}'
    ;;
    expires)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F'=|,' '{print $4}'
    ;;
    avg_ttl)
    REDIS_INFO | grep -w "$R_COMMAND" | awk -F'=|,' '{print $6}'
    ;;
# CPU
    used_cpu_sys)
    REDIS_INFO | grep -w "used_cpu_sys" | awk -F':' '{print $2}'
    ;;
    used_cpu_user)
    REDIS_INFO | grep -w "used_cpu_user" | awk -F':' '{print $2}'
    ;;
    used_cpu_sys_children)
    REDIS_INFO | grep -w "used_cpu_sys_children" | awk -F':' '{print $2}'
    ;;
    used_cpu_user_children)
    REDIS_INFO | grep -w "used_cpu_user_children" | awk -F':' '{print $2}'
    ;;
# Cluster
    cluster)
    REDIS_INFO | grep "cluster" | awk -F':' '{print $NF}'
    ;;
    *)
    esac
