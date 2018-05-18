. C:\projects\marktest\windows-env.ps1

Write-Output "Installing Puppet Agent..."
if ("$ARCH" -eq "x86") {
  $global:PuppetMSIUrl = "https://downloads.puppetlabs.com/windows/puppet-agent-x86-latest.msi"
} else {
  $global:PuppetMSIUrl = "https://downloads.puppetlabs.com/windows/puppet-agent-x64-latest.msi"
}

# Install Puppet Agent
Download-File "$PuppetMSIUrl" $PackerDownloads\puppet-agent.msi
Start-Process -Wait "msiexec" -PassThru -NoNewWindow -ArgumentList "/i $PackerDownloads\puppet-agent.msi /qn /norestart PUPPET_AGENT_STARTUP_MODE=manual"
Write-Output "Installed Puppet Agent..."

