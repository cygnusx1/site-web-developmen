
set :default_environment, {
'PATH' => "/usr/local/rvm/gems/ruby-1.9.2-p0/bin:/usr/local/rvm/bin:/usr/local/rvm/ruby-1.9.2-p0/bin:$PATH:~/.gems",
'BUNDLER_PATH' => "/home//.gems",
'RUBY_VERSION' => 'ruby 1.9.2',
'GEM_HOME' => '/home//.gems',
'GEM_PATH' => '/home//.gems:/usr/local/rvm/gems/ruby-1.9.2-p0',
}


set :application, "site web developmen"
set :repository,  "http://svn.consultationbelogic.com/svn/developmenweb/trunk"
set :domain, "www.consultationbelogic.com"     # The URL for your app
set :user, "consult0"                          # Your HostingRails username

set :svn_username, "ben"
set :svn_password, "aa2008aa"

set :scm, :subversion
set :use_sudo, false                                # HostingRails users don't have sudo access

set(:deploy_to) { "/home/consult0/apps/developmenweb/production" }
set :deploy_via, :checkout                            # For this tutorial, svn checkout will be the deployment method, but check out :remote_cache in the future
set :group_writable, false
# test.monsalaire.ca ==> 3000
# www.monsalaire.ca ==> 3100`
set :mongrel_port, "4056"                           # Mongrel port that was assigned to you
set :mongrel_nodes, "1"                             # Number of Mongrel instances for those with multiple Mongrels
role :web, "consultationbelogic.com"                          # Your HTTP server, Apache/etc
role :app, "consultationbelogic.com"                          # This may be the same as your `Web` server
role :db,  "consultationbelogic.com", :primary => true # This is where Rails migrations will run

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