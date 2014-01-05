# Installation class for smartmontools module
class smartmontools::install {
  package { 'smartmontools':
    ensure  => installed,
    require => Class['nrpe::install'],
  }
  # end class
}
