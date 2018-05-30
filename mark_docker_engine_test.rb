require 'spec_helper_acceptance'

 it 'should start a container with cpuset paramater set' do
        pp=<<-EOS
          class { 'docker':}
            docker_ee => true,
          }
        EOS

        apply_manifest(pp, :catch_failures => true)
        apply_manifest(pp, :catch_changes => true) unless fact('selinux') == 'true'

        # A sleep to give docker time to execute properly
        sleep 4

        shell('ps -aux | grep docker') do |r|
          expect(r.stdout).to match(/--cpuset-cpus=0/)
        end
      end
