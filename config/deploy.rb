set :application, "eve-alert"
set :repository,  "git@github.com:benders/eve-alert.git"

set :user, "evealert"
set :deploy_to, "/srv/#{user}/#{application}"
set :debug, true

set :scm, :git

set :branch, "master"
set :deploy_via, :remote_cache
set :use_sudo, false

role :app, "construct.slackworks.com"                     # This may be the same as your `Web` server
role :db,  "construct.slackworks.com", :primary => true   # This is where Rails migrations will run

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

set :rails_env, 'production'
set :ruby, '/opt/ree/bin/ruby'

after "deploy", "deploy:cleanup"

# Lovingly stolen from Viget Labs' Capfile
Dir['lib/recipes/*.rb'].each { |recipe| load(recipe) }
