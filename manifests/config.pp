# Configuration class for smartmontools module
class smartmontools::config {
  file { '/etc/smartd.conf':
    ensure  => present,
    content => template('smartmontools/smartd.conf.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    # smartd will restart when you edit this file.
    notify  => Class['smartmontools::service'],
    require => Class['smartmontools::install'],
  }
  # Add files to check SMART values via NRPE
  file { $smartmontools::params::smartmontools_check_smart_file:
    ensure  => present,
    source  => 'puppet:///modules/smartmontools/check_smart',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Class['nrpe::install'],
    notify  => Class['nrpe::service'],
  }
  file { $smartmontools::params::smartmontools_check_smartctl_file:
    ensure  => absent,
    source  => 'puppet:///modules/smartmontools/check_smartctl',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Class['nrpe::install'],
    notify  => Class['nrpe::service'],
  }
  file { $smartmontools::params::smartmontools_nrpe_config_file:
    ensure  => present,
    content => template("smartmontools/check-smart-${::osfamily}.cfg.erb"),
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Class['nrpe::install'],
    notify  => Class['nrpe::service'],
  }
  file { '/etc/sudoers.d/11_nrpe_smartctl':
    ensure  => file,
    require => Class['nrpe::install'],
    source  => $smartmontools::params::smartmontools_sudo_file,
    owner   => 'root',
    group   => 'root',
    mode    => '0440',
  }

  # Apply a fixed init script to Ubuntu 10.04 hosts
  if ( $::operatingsystem == 'Ubuntu' ) {
    file { '/etc/init.d/smartmontools':
      source  => 'puppet:///modules/smartmontools/smartmontools',
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      notify  => Class['smartmontools::service'],
      require => Class['smartmontools::install'],
    }
    file { '/etc/default/smartmontools':
      source  => 'puppet:///modules/smartmontools/smartmontools-default',
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      notify  => Class['smartmontools::service'],
      require => Class['smartmontools::install'],
    }
  }

    # end class
}
