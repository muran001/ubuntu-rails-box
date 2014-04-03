
include_recipe "rbenv::default"
include_recipe "rbenv::ruby_build"

include_recipe "rbenv::rbenv_vars"

rbenv_ruby "2.1.1" do
  ruby_version "2.1.1"
  global true
end

rbenv_gem "rails" do
  version "4.0.4"
end

