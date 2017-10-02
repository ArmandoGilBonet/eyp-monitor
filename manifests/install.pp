class monitor::install inherits monitor {

  if($monitor::manage_package)
  {
    package { $monitor::params::package_name:
      ensure => $monitor::package_ensure,
    }
  }

}
