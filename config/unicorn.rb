# config/unicorn.rb
env = ENV['RAILS_ENV'] || 'production'

preload_app true
timeout 30

if env == 'production'
  worker_processes 4
elsif env == 'staging'
  worker_processes 2
end

user 'git', 'git'

# Set your full path to application
app_dir = File.expand_path('../../', __FILE__)
shared_dir = File.expand_path('../../../../shared/', __FILE__)

# Set unicorn options

# Fill path to your app
working_directory app_dir
pid "#{shared_dir}/pids/unicorn.pid"

# Set up socket location
listen "#{shared_dir}/sockets/unicorn.sock", :backlog => 64

# Loging
stderr_path "#{shared_dir}/log/unicorn.stderr.log"
stdout_path "#{shared_dir}/log/unicorn.stdout.log"

# Set master PID location

before_exec do |server|
  ENV['BUNDLE_GEMFILE'] = "#{app_dir}/current/Gemfile"
end

before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exist?(old_pid) && server.pid != old_pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
