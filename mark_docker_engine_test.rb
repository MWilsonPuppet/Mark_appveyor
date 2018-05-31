require 'rspec'
require 'serverspec'
  set :backend, :cmd
  set :os, :family => 'windows'

describe command('docker -ps') do
  its(:exit_status) { should eq 1 }
end          
