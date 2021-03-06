# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'sinatratest'
set :repo_url, 'git@github.com:sljuka/sinatratest.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/deploy/apps/sinatratest'

set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, '2.2.2'

set :passenger_restart_with_sudo, true # default

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('logs', 'pids', 'tmp', 'vendor/bundle')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do
 
  desc "Restart unicorn server gracefully"
  task :restart do
    on roles(:app) do
      execute :mkdir, '-p', current_path.join('tmp')
      execute :touch, current_path.join('tmp/restart.txt')
    end
  end

end

after 'deploy:publishing', 'deploy:restart'
