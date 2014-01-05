# Puppet module for smartmontools

## Overview

This Puppet module allows for the installation and configuration of smartmontools.  This module has been tested on CentOS/RedHat, Ubuntu and SuSE.

Made by Jason Wever

This module is released under the terms of the GPLv2 license.

## Setup

If you want to to have smartmontools email a default user, edit `manifests/init.pp` and set the `$email` variable to the preferred email address.

## Usage

Default usage:
```puppet
  class { 'smartmontools': }
```
This will monitor `/dev/sda` and `/dev/sdb` and send an email to the email address set in the `manifests/init.pp` file.

Specifying drivess:
```puppet
  class {'smartmontools':
    drives => [ 'sda', 'sdb', 'sdc' ],
  }
```
This will monitor drives `/dev/sda`, `/dev/sdb` and `/dev/sdc` and send an email to the email address set in the `manifests/init.pp` file.

## Parameters

* 'drives' - drives to monitor
* 'drivetype' - drive interface (e.g. ata, scsi, etc.)
* 'email' - email address for notifications
