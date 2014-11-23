set :stage, :production
set :rails_env, 'production'
set :deploy_to, '/home/git/webapps/Muffin-rails_production/'
set :branch, 'master'

# For everywhere

# role :app, %w{git@muffin.stephane-barale.com}
# role :web, %w{git@muffin.stephane-barale.com}
# role :db, %w{git@muffin.stephane-barale.com}

# server 'muffin.stephane-barale.com',
#        user: 'git',
#        roles: %w{web app},
#        primary: true,
#        ssh_options: {
#            keys: %w(/home/sbarale/.ssh/id_rsa.pub),
#            forward_agent: false,
#            auth_methods: %w(publickey),
#            port: 2424
#        }

# For my home

role :app, %w{git@192.168.1.12}
role :web, %w{git@192.168.1.12}
role :db, %w{git@192.168.1.12}

server '192.168.1.12',
       user: 'git',
       roles: %w{web app db},
       primary: true,
       ssh_options: {
           keys: %w(/Users/sbarale/.ssh/id_rsa),
           forward_agent: false,
           auth_methods: %w(publickey),
           port: 2424
       }

set :unicorn_worker_count, 4
set :enable_ssl, false


# Simple Role Syntax
# ==================
# Supports bulk-adding hosts to roles, the primary
# server in each group is considered to be the first
# unless any hosts have the primary property set.
# role :app, %w{git@muffin.stephane-barale.com}
# role :web, %w{git@muffin.stephane-barale.com}
# role :db, %w{git@muffin.stephane-barale.com}

# Extended Server Syntax
# ======================
# This can be used to drop a more detailed server
# definition into the server list. The second argument
# something that quacks like a hash can be used to set
# extended properties on the server.
# server 'example.com', user: 'deploy', roles: %w{web app}, my_property: :my_value

# you can set custom ssh options
# it's possible to pass any option but you need to keep in mind that net/ssh understand limited list of options
# you can see them in [net/ssh documentation](http://net-ssh.github.io/net-ssh/classes/Net/SSH.html#method-c-start)
# set it globally
# set :ssh_options, {
#                     keys: %w(/home/sbarale/.ssh/id_rsa.pub),
#                     forward_agent: false,
#                     auth_methods: %w(publickey),
#                     port: 2424
#                 }
# and/or per server#   ssh_options: {
#     user: 'user_name', # overrides user setting above
#     keys: %w(/home/user_name/.ssh/id_rsa),
#     forward_agent: false,
#     auth_methods: %w(publickey password)
#     # password: 'please use keys'
#   }
# setting per server overrides global ssh_options

# fetch(:default_env).merge!(rails_env: :production)
