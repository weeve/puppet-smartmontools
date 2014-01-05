# Parameters class for smartmontools package
class smartmontools::service {
  service { $smartmontools::params::smartmontools_service:
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
    require    => Class['smartmontools::config'],
  }
  #end class
}
