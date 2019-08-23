s3server:
   S3Config_Sections: [S3_SERVER_CONFIG, S3_AUTH_CONFIG, S3_CLOVIS_CONFIG, S3_THIRDPARTY_CONFIG]
   S3_SERVER_CONFIG:                                     # Section for S3 Server
      S3_DAEMON_WORKING_DIR: "/var/mero/"                # S3 Daemon will run in the specified directory
      S3_DAEMON_DO_REDIRECTION: 1                          # Do redirection of stderr, stdout and stdin to /dev/null
      S3_LOG_DIR: "/var/log/seagate/s3"                    # S3 Log directory, for output to stderr have value as "" and set S3_DAEMON_DO_REDIRECTION to 0
      S3_LOG_MODE: DEBUG                                    # logging levels, levels can be DEBUG, INFO, WARN, ERROR, FATAL, default is INFO
      S3_LOG_FILE_MAX_SIZE: 100                            # Maximum log file size in MB, default is 100 MB
      S3_LOG_ENABLE_BUFFERING: false                        # DEBUG, INFO & WARN logs are buffered if buffering is enabled. ERROR and FATAL logs are always flushed. Default is true.
      S3_ENABLE_AUTH_SSL: true                             # Enable ssl communication between s3 server and auth server
      S3_REUSEPORT: false                                  # Enable reusing s3 server port
      S3_MERO_HTTP_REUSEPORT: true                         # Enable reusing mero http server port
      S3_IAM_CERT_FILE: "/etc/ssl/stx-s3/s3auth/s3authserver.crt" # IAM Auth certificate file
      S3_LOG_FLUSH_FREQUENCY: 30                           # Time in seconds, after which logs will be flushed. Valid only if S3_LOG_ENABLE_BUFFERING is true. Default is 30 seconds.
      S3_AUDIT_LOG_CONFIG: "/opt/seagate/s3/conf/s3server_audit_log.properties" # S3 Server Audit log configuration file.
      S3_AUDIT_LOG_FORMAT_TYPE: "JSON"                     # S3 Server Audit log format type. JSON logs in json format & S3_FORMAT logs in s3 format.
      S3_AUDIT_LOGGER_POLICY: "disabled"                   # Audit info logger policy: disabled - logger disabled; rsyslog-tcp - send logs to rsyslog via tcp socket; log4cxx - use log4cxx; syslog - send logs to rsyslog via syslog call;
      S3_AUDIT_LOGGER_HOST: "localhost"                    # Remote host name to connect to if logger needs to work via network
      S3_AUDIT_LOGGER_PORT: 514                            # Remote port to connect to if logger needs to work via network
      S3_AUDIT_LOGGER_RSYSLOG_MSGID: "s3server-audit-logging"  # Rsyslog msgid to filter messages
      S3_SERVER_IPV4_BIND_ADDR: 0.0.0.0                    # S3 Server ipv4 bind address, 0.0.0.0 is default. ~ means option is ignored/not to listen on IPv4 address.
      S3_SERVER_IPV6_BIND_ADDR: ~                          # S3 Server ipv6 bind address, ::/128 is default. ~ means option is ignored/not to listen on IPv6 address.
      S3_SERVER_BIND_PORT: 8081                            # S3 Server port number
      S3_SERVER_MERO_HTTP_BIND_ADDR: 127.0.0.1             # S3 Server bind addresss to perform mero operations over HTTP, 127.0.0.1 is default.
      S3_SERVER_MERO_HTTP_BIND_PORT: 7081                  # Port number to perform mero operations over HTTP.
      S3_SERVER_REGION_ENDPOINTS: [s3-us-west-2.seagate.com, s3-us.seagate.com, s3-europe.seagate.com, s3-asia.seagate.com]
      S3_SERVER_DEFAULT_ENDPOINT: s3.seagate.com
      S3_SERVER_SHUTDOWN_GRACE_PERIOD: 10                  # S3 server shutdown grace period in seconds, default is 10 seconds.
      S3_SERVER_SSL_ENABLE: false                          # Enable ssl in s3server
      S3_SERVER_CERT_FILE: "/etc/ssl/stx-s3/s3/ca.crt"     # s3server ssl cerificate file
      S3_SERVER_PEM_FILE: "/etc/ssl/stx-s3/s3/s3server.pem" # s3server ssl pem file
      S3_SERVER_SSL_SESSION_TIMEOUT: 172800                # SSL session timeout in seconds 48 hrs
      S3_ENABLE_PERF: 0                                    # S3 Performance metric collection, to enable have value 1, default is 0 (disabled)
      S3_PERF_LOG_FILENAME: "/var/log/seagate/s3/perf.log" # S3 Perf Log file name
      S3_READ_AHEAD_MULTIPLE: 1                            # Maximum units of size (S3_CLOVIS_UNIT_SIZE * S3_CLOVIS_MAX_UNITS_PER_REQUEST) to read ahead or buffer in-memory
      S3_MAX_RETRY_COUNT: 3                                # Max retry count in case of failure
      S3_ENABLE_MURMURHASH_OID: false                      # Enable OID generation using Murmur Hash Alg. Default is to have unique OID generated by mero helper library.
      S3_RETRY_INTERVAL_MILLISEC: 5                        # Retry interval in milliseconds
      S3_CLIENT_REQ_READ_TIMEOUT_SECS: 5                   # Read timeout in seconds.
      S3_ENABLE_STATS: false                               # Enable the Stats feature. Default is false.
      S3_STATSD_IP_ADDR: 127.0.0.1                         # StatsD server IP address
      S3_STATSD_PORT: 8125                                 # StatsD server port
      S3_STATSD_MAX_SEND_RETRY: 3                          # Limit the user requested retry count. A retry is attempted in case message delivery to StatsD server fails.
      S3_STATS_WHITELIST_FILENAME: "/opt/seagate/s3/conf/s3stats-whitelist.yaml"  # White list of Stats metrics to be published to the backend.
      S3_SERVER_ENABLE_OBJECT_LEAK_TRACKING: false         # Enables the object leak feature changes
   S3_AUTH_CONFIG:                                         # Section for S3 Auth Service
      S3_AUTH_IP_ADDR: ipv4:127.0.0.1                      # Auth server IP address Should be in below format:
                                                         # ipv4 address format: ipv4:127.0.0.1
                                                         # ipv6 address format: ipv6:::1
      S3_AUTH_PORT: 9086                                   # Auth server port for https request
   S3_CLOVIS_CONFIG:                                     # Section for S3 Clovis
      S3_CLOVIS_LOCAL_ADDR: <ipaddress>@tcp:12345:33:100   # Clovis end points, replace <ipaddress> with host's ip address
      S3_CLOVIS_HA_ADDR: <ipaddress>@tcp:12345:34:1        # Clovis end point, replace <ipaddress> with host's ip address
      S3_CLOVIS_PROF: <0x7000000000000001:0>               # Clovis end point
      S3_CLOVIS_LAYOUT_ID: 9                               # Clovis will select a Unit size of a layout according to the
                                                         # layout id set in the configuration file, mapping is as follows:
                                                         # 1->4K, 2->8K, 3->16K, 4->32K, 5->64K, 6->128K, 7->256K, 8->512K, 9->1024K,
                                                         # 10->2048K, 11->4096K, 12->8192K, 13->16384K, 14->32768K, default is layout id 9 (1 MB)
      S3_CLOVIS_UNIT_SIZE: 1048576                         # Clovis unit size w.r.t layout id for an IO operation
      S3_CLOVIS_MAX_UNITS_PER_REQUEST: 1                   # Maximum units per read/write request to clovis
      S3_CLOVIS_MAX_IDX_FETCH_COUNT: 30                    # COSTOR-157. Clovis will read from index(If not specified) at a time maximim of this many key values
      S3_CLOVIS_IS_OOSTORE: true                           # Clovis oostore mode is set when this flag is true, default is false (oostore mode is not set)
      S3_CLOVIS_IS_READ_VERIFY: false                      # Clovis Flag for verify-on-read. Parity is checked during READ's if this flag is true, default is false
      S3_CLOVIS_TM_RECV_QUEUE_MIN_LEN: 16                  # Minimum length of the 'tm' receive queue for clovis, default is 2
      S3_CLOVIS_MAX_RPC_MSG_SIZE: 262144                   # COSTOR-157. Maximum rpc message size for clovis, default is 131072 (128k)
      S3_CLOVIS_PROCESS_FID: <0x7200000000000000:0>        # FID of the Resource manager for Clovis
      S3_CLOVIS_IDX_SERVICE_ID: 1                          # Types of index services supported by Clovis, mapping is: 0->Mock KVS, 1->Mero KVS, 2->Cassandra KVS, default is 2 (Cassandra KVS)
      S3_CLOVIS_CASS_CLUSTER_EP: 127.0.0.1                 # Cassandra cluster end point
      S3_CLOVIS_CASS_KEYSPACE: "clovis_index_keyspace"     # Cassandra keyspace
      S3_CLOVIS_CASS_MAX_COL_FAMILY_NUM: 1                 # Cassandra max column family number, default is 1
      S3_UNIT_SIZES_FOR_MEMORY_POOL: [4096, 8192, 16384, 32768, 65536, 131072, 262144, 524288, 1048576] # Memory pool will be created for each of these unit_size with following properties
      S3_CLOVIS_READ_POOL_INITIAL_BUFFER_COUNT: 10        # 10 blocks, the initial pool size = multiple of S3_CLOVIS_UNIT_SIZE
      S3_CLOVIS_READ_POOL_EXPANDABLE_COUNT: 50            # 50 blocks, pool's expandable size, multiple of S3_CLOVIS_UNIT_SIZE
      S3_CLOVIS_READ_POOL_MAX_THRESHOLD: 524288000        # 500 MB, The maximum memory threshold for the pool, multiple of S3_CLOVIS_UNIT_SIZE
   S3_THIRDPARTY_CONFIG:
      S3_LIBEVENT_POOL_BUFFER_SIZE: 16384                  # Pool buffer size, in case of S3_CLOVIS_UNIT_SIZE of size 1MB, it is recommended to have S3_LIBEVENT_POOL_BUFFER_SIZE of size 16384
      S3_LIBEVENT_MAX_READ_SIZE: 16384                     # Maximum read in a single read operation, as per libevent documentation in code, user should not try to read more than this value
      S3_LIBEVENT_POOL_INITIAL_SIZE: 209715200             # Two Hundred 1mb blocks, the initial pool size, multiple of S3_CLOVIS_UNIT_SIZE
      S3_LIBEVENT_POOL_EXPANDABLE_SIZE: 104857600          # 100mb, pool's expandable size, multiple of S3_CLOVIS_UNIT_SIZE
      S3_LIBEVENT_POOL_MAX_THRESHOLD: 524288000            # 500 MB, The maximum memory threshold for the pool, multiple of S3_CLOVIS_UNIT_SIZE
