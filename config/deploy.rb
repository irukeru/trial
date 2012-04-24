set :application, "trials"
set :repository,  "git@github.com:irukeru/trial.git"
set :deploy_to, "/home/irukeru/work/web/milvus/projects/trials"
set :branch, "master"
set :user, "deploy"
set :use_sudo, false
set :ee_system, "system"

set :scm, :git
set :scm_username, "irukeru"
set :scm_password, "asdzxc123"


role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true # This is where Rails migrations will run

ssh_options[:forward_agent] = true


#role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
