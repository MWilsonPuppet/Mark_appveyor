workflow apply_manifest {
  cd C:\Projects\marktest
  puppet apply --debug docker_install.pp
  Restart-Computer -Wait
  docker ps
}
