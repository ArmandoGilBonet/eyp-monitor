class monitor::service inherits monitor {

  #
  validate_bool($monitor::manage_docker_service)
  validate_bool($monitor::manage_service)
  validate_bool($monitor::service_enable)

  validate_re($monitor::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${monitor::service_ensure}")

  $is_docker_container_var=getvar('::eyp_docker_iscontainer')
  $is_docker_container=str2bool($is_docker_container_var)

  if( $is_docker_container==false or
      $monitor::manage_docker_service)
  {
    if($monitor::manage_service)
    {
      service { $monitor::params::service_name:
        ensure => $monitor::service_ensure,
        enable => $monitor::service_enable,
      }
    }
  }
}
