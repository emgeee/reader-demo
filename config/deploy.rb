# Needed for proper deployment. Must maintain latest versions both locally
# and on the server.

#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "bundler/capistrano"

set :user, 'ubuntu'
set :domain, '54.235.171.54'
set :application, 'tearsheet'

# adjust if you are using RVM, remove if you are not
# $:.unshift(File.expand_path('./lib', ENV['rvm_path']))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user

# file paths
set :repository,  "git@github.com:emgeee/reader-demo.git" 
set :deploy_to, "/home/#{user}/#{application}/code"

# distribute your applications across servers (the instructions below put them
# all on the same server, defined above as 'domain', adjust as necessary)
role :app, domain
role :web, domain
role :db, domain, :primary => true

# you might need to set this if you aren't seeing password prompts
# default_run_options[:pty] = true

# As Capistrano executes in a non-interactive mode and therefore doesn't cause
# any of your shell profile scripts to be run, the following might be needed
# if (for example) you have locally installed gems or applications.  Note:
# this needs to contain the full values for the variables set, not simply
# the deltas.
# default_environment['PATH']='<your paths>:/usr/local/bin:/usr/bin:/bin'
# default_environment['GEM_PATH']='<your paths>:/usr/lib/ruby/gems/1.8'

# miscellaneous options
set :deploy_via, :remote_cache
set :scm, 'git'
set :branch, 'master'
set :scm_verbose, true
set :use_sudo, false
set :rails_env, "production"

namespace :deploy do
  desc "cause Passenger to initiate a restart"
  task :restart do
    run "touch #{current_path}/tmp/restart.txt" 
  end

  desc "reload the database with seed data"
  task :seed do
    run "cd #{current_path}; rake db:seed RAILS_ENV=#{rails_env}"
  end

#  desc "build missing paperclip styles"
#  task :build_missing_paperclip_styles, :roles => :app do
#   run "cd #{release_path}; RAILS_ENV=production bundle exec rake paperclip:refresh:missing_styles"
#  end
end

after "deploy:update_code", :bundle_install
desc "install the necessary prerequisites"
task :bundle_install, :roles => :app do
  run "cd #{release_path} && bundle install"
end

#after("deploy:update_code", "deploy:build_missing_paperclip_styles")