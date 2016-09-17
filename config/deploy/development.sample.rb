set :state, :development
role :app, %w{root@${IP_ADDRESS}}
role :web, %w{root@${IP_ADDRESS}}
role :db, %w{root@${IP_ADDRESS}}

server '${IP_ADDRESS}',
  user: 'root',
  roles: %w{web app db},
  ssh_options: {
    auth_methods: %w{password},
    password: '******'
  }
