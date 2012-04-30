set :application, "trial"
set :repository,  "git@github.com:irukeru/trial.git"
set :deploy_to, "/home/deploy/projects/#{application}"
set   :domain,  "dev.milvus.com.tr"

set :branch, "master"
set :user, "deploy"
set :use_sudo, false
set :ee_system, "system"

set :scm, :git
set :scm_username, "irukeru"
set :scm_password, "asdzxc123"


role :web, "dev.milvus.com.tr"                          # Your HTTP server, Apache/etc
role :app, "li443-28.members.linode.com"                          # This may be the same as your `Web` server
role :db,  "dev.milvus.com.tr", :primary => true # This is where Rails migrations will run

ssh_options[:forward_agent] = true

set :current_path, "#{deploy_to}/current"
set :releases_path, "#{deploy_to}/releases/"
set :shared_path, "#{deploy_to}/shared/"

namespace:deploy do
    task:start do
    end
    task:stop do
    end
    task:finalize_update do
        run "chmod -R g+w #{release_path}"
    end
    task:restart do
    end
   after "deploy:restart" do
         #add any tasks in here that you want to run after the project is deployed
         run "rm -rf #{release_path}.git"
   end
end

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
