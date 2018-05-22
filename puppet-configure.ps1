. C:\projects\marktest\windows-env.ps1

Write-Output "Downloading Puppet Agent..."
if ("$ARCH" -eq "x86") {
  $global:PuppetMSIUrl = "https://downloads.puppetlabs.com/windows/puppet-agent-x86-latest.msi"
} else {
  $global:PuppetMSIUrl = "https://downloads.puppetlabs.com/windows/puppet-agent-x64-latest.msi"
}

Write-Output "Installing Puppet Agent..."
# Install Puppet Agent
Download-File "$PuppetMSIUrl" $PackerDownloads\puppet-agent.msi
Start-Process -Wait "msiexec" -PassThru -NoNewWindow -ArgumentList "/i $PackerDownloads\puppet-agent.msi /qn /norestart PUPPET_AGENT_STARTUP_MODE=manual"
Write-Output "Installed Puppet Agent..."
$ENV:PATH="$ENV:PATH;C:\Program Files\Puppet Labs\Puppet\bin"
echo $ENV:PATH

Write-Output "Cloning branch"
cd C:/ProgramData/PuppetLabs/code/environments/production/modules
git config --global user.name MarkW
git config --global user.email mark.wilson@puppetlabs.com
git clone https://github.com/puppetlabs/puppetlabs-docker.git
cd puppetlabs-docker
git checkout -b mihaibuzgau-master master
git pull https://github.com/mihaibuzgau/puppetlabs-docker.git master


