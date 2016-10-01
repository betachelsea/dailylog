lock '3.6.1'

set :application, 'dailylog'
set :repo_url, 'https://github.com/betachelsea/dailylog'

set :branch, 'master'
set :deploy_to, '/var/www/app/dailylog'
set :scm, :git
set :log_leve, :debug
set :pty, true

set :bundle_binstubs, nil
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets bundle public/system public/assets}
set :default_env, { path: "usr/local/rbenv/shims:/usr/local/rbenv/bin:$PATH" }
set :keep_releases, 5
set :linked_files, %w{ config/secrets.yml }

namespace :deploy do
  after :finishing, 'deploy:cleanup'
end
