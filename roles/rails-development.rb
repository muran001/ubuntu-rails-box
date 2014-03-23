name 'rails-development'
description 'setup for ruby on rails core development'
run_list(
  "recipe[apt]",
  "recipe[git]",
  "recipe[sqlite]",
  "recipe[mysql::client]",
  "recipe[mysql::ruby]",
  "recipe[mysql::server]",
  "recipe[memcached]",
  "recipe[nodejs::install_from_binary]",
  "recipe[ruby_build]",
  "recipe[rbenv::system]",
  "recipe[rbenv::vagrant]",
)
