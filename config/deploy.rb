set :application, "zarabarbosa"
set :repo_url, "git@github.com:davidejhonatan/zarabarbosa.git"
set :user, 'ubuntu'

#set :branch, :master
#set :deploy_to, '/home/ubuntu/zarabarbosa'
#set :pty, true
#set :linked_files, %w{config/database.yml config/application.yml}
#set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/uploads}
#set :keep_releases, 5
#set :rvm_type, :user

#set :rvm_map_bins, %w{gem rake ruby rails bundle}
#set :rvm_ruby_version, 'jruby-1.7.19' # Edit this if you are using MRI Ruby

#set :puma_rackup, -> { File.join(current_path, 'config.ru') }
#set :puma_state, "#{shared_path}/tmp/pids/puma.state"
#set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
#set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
#set :puma_conf, "#{shared_path}/puma.rb"
#set :puma_access_log, "#{shared_path}/log/puma_error.log"
#set :puma_error_log, "#{shared_path}/log/puma_access.log"
#set :puma_role, :app
#set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
#set :puma_threads, [0, 8]
#set :puma_workers, 0
#set :puma_worker_timeout, nil
#set :puma_init_active_record, true
#set :puma_preload_app, false

set :deploy_to, "/var/www/zarabarbosa"
 
append :linked_files, "config/database.yml", "config/secrets.yml"#, "config/storage.yml", "config/master.key"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "public/assets"#,"public/assets","public/img"
 
set :keep_releases, 5
set :migration_role, :app

set :ssh_options, { forward_agent: true, user: fetch(:user), keys: %w(/vagrant/key/newkey.pem) }

set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"

#ADD início
# set :puma_env, fetch(:rack_env, fetch(:rails_env, 'production'))
#ADD Fim


set :nginx_sites_available_path, "/etc/nginx/sites-available"
set :nginx_sites_enabled_path, "/etc/nginx/sites-enabled"
 
set :rvm_ruby_version, '2.4.3'


namespace :puma do
    desc 'Create Puma dirs'
    task :create_dirs do
      on roles(:app) do
        execute "mkdir #{shared_path}/tmp/sockets -p"
        execute "mkdir #{shared_path}/tmp/pids -p"
      end
    end
   
    desc "Restart Nginx"
    task :nginx_restart do
      on roles(:app) do
        execute "sudo service nginx restart"
      end
    end
   
    before :start, :create_dirs
    after :start, :nginx_restart
  end