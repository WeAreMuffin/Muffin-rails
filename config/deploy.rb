set :application, 'Muffin-rails'
set :user, 'git'

set :scm, :git
set :repo_url, 'https://github.com/WeAreMuffin/Muffin-rails.git'

set :rvm1_ruby_version, '2.1.3'

set :unicorn_config_path, 'config/unicorn.rb'

# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }

# set :deploy_to, '/var/www/my_app'

# set :format, :pretty
# set :log_level, :debug

set :linked_files, %w{config/database.yml config/application.yml config/secrets.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# set :default_env, { path: "/opt/ruby/bin:$PATH" }
set :keep_releases, 5

# set :tests, []

set :bundle_without, %w{development test}.join(' ')
set :bundle_roles, :all

set :pty, true

namespace :bundler do
  desc 'Install gems with bundler.'
  task :install do
    on roles fetch(:bundle_roles) do
      within release_path do
        execute :bundle, 'install', "--without #{fetch(:bundle_without)}"
      end
    end
  end
end

namespace :app do
  task :update_rvm_key do
    on roles(:app) do
      execute :gpg2, '--keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3'
    end
  end
end
before 'rvm1:install:rvm', 'app:update_rvm_key'
before 'deploy', 'rvm1:install:rvm'
before 'deploy', 'rvm1:install:ruby'
before 'deploy', 'bundler:install'
before 'deploy:updated', 'bundler:install'

before 'deploy', 'setup_unicorn_directory:sockets'
after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  desc 'Restart application'
  task :restart do
    invoke 'unicorn:restart'
    on roles(:app), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
end
