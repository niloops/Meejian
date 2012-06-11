set :rvm_ruby_string, 'default'
set :rvm_type, :system

require 'bundler/capistrano'

set :scm, :git
set :application, "Meejian"
set :repository,  "git@github.com:Lilu/Meejian.git"
set :user, "deployer"
set :ssh_options, {forward_agent: true}
set :deploy_via, :remote_cache
set :deploy_to, "/var/meejian"
set :use_sudo, false

role :web, "meejian.com"
role :app, "meejian.com"
role :db,  "meejian.com", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path, 'tmp', 'restart.txt')}"
  end
end
