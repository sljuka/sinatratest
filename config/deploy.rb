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

  task :environment do
    set :unicorn_pid, "#{shared_path}/pids/unicorn.pid"
    set :unicorn_config, "#{current_path}/unicorn.rb"
    set :unicorn_path, "/home/deploy/.rbenv/shims/unicorn"
  end
 
  def start_unicorn
    within current_path do
      execute "#{fetch(:unicorn_path)} -c #{fetch(:unicorn_config)} -D"
    end
  end
 
  def stop_unicorn
    execute :kill, "-s QUIT $(< #{fetch(:unicorn_pid)})"
  end
 
  def reload_unicorn
    execute :kill, "-s USR2 $(< #{fetch(:unicorn_pid)})"
  end
 
  def force_stop_unicorn
    execute :kill, "$(< #{fetch(:unicorn_pid)})"
  end
 
  desc "Start unicorn server"
  task :start => :environment do
    on roles(:app) do
      start_unicorn
    end
  end
 
  desc "Stop unicorn server gracefully"
  task :stop => :environment do
    on roles(:app) do
      stop_unicorn
    end
  end
 
  desc "Restart unicorn server gracefully"
  task :restart => :environment do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        reload_unicorn
      else
        start_unicorn
      end
    end
  end
 
  desc "Stop unicorn server immediately"
    task :force_stop => :environment do
      on roles(:app) do
        force_stop_unicorn
      end
    end
  end
  
  after 'deploy:publishing', 'deploy:restart'

end
