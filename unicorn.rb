# Set the working application directory
# working_directory "/path/to/your/app"
working_directory "/home/deploy/apps/sinatratest/current/my_app"

# Unicorn PID file location
# pid "/path/to/pids/unicorn.pid"
pid "/home/deploy/apps/sinatratest/current/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/logs/unicorn.log"
# stdout_path "/path/to/logs/unicorn.log"
stderr_path "/home/deploy/apps/sinatratest/current/logs/unicorn.log"
stdout_path "/home/deploy/apps/sinatratest/current/logs/unicorn.log"

# Unicorn socket
# listen "/tmp/unicorn.[app name].sock"
listen "/tmp/unicorn.sinatratest.sock"

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30
