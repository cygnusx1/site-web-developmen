load 'deploy' if respond_to?(:namespace) # cap2 differentiator

# Uncomment if you are using Rails' asset pipeline
# load 'deploy/assets'

Dir['vendor/gems/*/recipes/*.rb','vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }

load 'config/deploy' # remove this line to skip loading any of the default tasks

# ========================
# For Mongrel Cluster Apps
# ========================

namespace :deploy do
   task :start, :roles => :app do
     run "cd #{current_path} && mongrel_rails cluster::configure -e production -p #{mongrel_port} -N #{mongrel_nodes} -c #{current_path} --user #{user} --group #{user}"
     run "cd #{current_path} && mongrel_rails cluster::start"
     run "rm -rf /home/#{user}/test.developmen.ca"
     run "ln -s #{current_path}/public /home/#{user}/test.developmen.ca"

     run "mkdir -p #{deploy_to}/shared/config"
     run "mv #{current_path}/config/mongrel_cluster.yml #{deploy_to}/shared/config/mongrel_cluster.yml"
     run "ln -s #{deploy_to}/shared/config/mongrel_cluster.yml #{current_path}/config/mongrel_cluster.yml"
   end

   task :restart, :roles => :app do
     run "find /home/consult0/apps/developmenweb/production/current/public -type d -exec chmod 0755 {} \\;"
     run "find /home/consult0/apps/developmenweb/production/current/public -type f -exec chmod 0644 {} \\;"
     run "chmod 0755 /home/consult0/apps/developmenweb/production/current/public/dispatch.*"
     run "ln -s #{deploy_to}/shared/config/mongrel_cluster.yml #{current_path}/config/mongrel_cluster.yml"
     run "cd #{current_path} && mongrel_rails mongrel::restart -C config/mongrel_cluster.yml"
   end

  task :stop, :roles => :app do
    run "cd #{current_path} && mongrel_rails cluster::stop"
  end
  
end

