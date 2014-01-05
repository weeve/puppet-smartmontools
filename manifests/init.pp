# This is a custom smartmontools module that currently ensures smartmontools is
# installed on the system, and includes a NRPE configuration stub

class smartmontools(
  $drives = [ 'sda', 'sdb', ],
  $drivetype = 'ata',
  $email = '',
) {
  require smartmontools::params
  include smartmontools::install, smartmontools::config, smartmontools::service
}
