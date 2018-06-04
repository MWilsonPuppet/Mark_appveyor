require 'rspec'
require 'serverspec'
  set :backend, :cmd
  set :os, :family => 'windows'

describe command('docker ps') do
  its(:exit_status) { should eq 0 }
end          

system ("powershell -File C:\\projects\\marktest\\test.ps1")
