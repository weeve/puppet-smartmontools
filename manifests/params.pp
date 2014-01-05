# Parameters class for smartmontools package
class smartmontools::params {
  case $::osfamily {
    Debian: {
      $smartmontools_service = 'smartmontools'
      $smartmontools_nrpe_config_file = '/etc/nagios/nrpe.d/check-smart.cfg'
      $smartmontools_sudo_file =
        'puppet:///modules/smartmontools/11_nrpe_smartctl-ubuntu'
      $smartmontools_check_smart_file = '/usr/lib/nagios/plugins/check_smart'
      $smartmontools_check_smartctl_file =
        '/usr/lib/nagios/plugins/check_smartctl'
      $smartmontools_nrpe_config_source_file =
        'puppet:///modules/smartmontools/check-smart-ubuntu.cfg'
    }
    RedHat: {
      $smartmontools_service = 'smartd'
      $smartmontools_nrpe_config_file = '/etc/nrpe.d/check-smart.cfg'
      $smartmontools_sudo_file =
        'puppet:///modules/smartmontools/11_nrpe_smartctl-redhat'
      $smartmontools_check_smart_file = '/usr/lib64/nagios/plugins/check_smart'
      $smartmontools_check_smartctl_file =
        '/usr/lib64/nagios/plugins/check_smartctl'
      $smartmontools_nrpe_config_source_file =
        'puppet:///modules/smartmontools/check-smart-redhat.cfg'
    }
    Suse: {
      $smartmontools_service = 'smartd'
      $smartmontools_nrpe_config_file = '/etc/nagios/nrpe.d/check-smart.cfg'
      $smartmontools_sudo_file =
        'puppet:///modules/smartmontools/11_nrpe_smartctl-suse'
      $smartmontools_check_smart_file = '/usr/lib/nagios/plugins/check_smart'
      $smartmontools_check_smartctl_file =
        '/usr/lib/nagios/plugins/check_smartctl'
      $smartmontools_nrpe_config_source_file =
        'puppet:///modules/smartmontools/check-smart-suse.cfg'
    }
    default: {
    }
  }
  #end class
}
