# config valid only for Capistrano 3.1
#lock '3.2.1'
require 'rvm1/capistrano3'

set :application, 'AgnuApp'
set :repo_url, 'git@github.com:FeetyPelk/agnu_app.git'
set :deploy_to, '/var/www/AgnuApp'
set :scm, :git
set :branch, "master"
set :user, "willum"
set :group, "ployes"
set :use_sudo, false
set :rails_env, "production"
set :deploy_via, :copy
#set :ssh_options, { :forward_agent => true, :port => 22 }
set :ssh_options, { :forward_agent => true, :keys => "/home/smurdock/garage/farral0n.pem", :port => 22 }
set :keep_releases, 3
set :default_env, { rvm_bin_path: '~/.rvm/bin' }

set :rvm1_ruby_version, "1.9.3"
