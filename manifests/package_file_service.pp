# Class stdmodule
#
# basic class skeleton
#
# used to demonstrate standard puppet resources
# - package
# - file
# - service
#
# also ordering of resources
#
# Author: Martin Alfke <tuxmea@gmail.com>
#
class stdmodule::package_file_service (
){
    # package resource
    package { 'vim':
        ensure => present,
    }
    package { 'bash':
        ensure => '4.2',
    }
    package { 'mysql-server':
        ensure  => absent,
        require => File['/etc/my.cnf'], # <- resource references are starting with capital letter
    }
    # config file
    file { '/etc/my.cnf':
        ensure  => absent,
        require => Service['mysqld'],
    }
    # service resource
    service { 'mysqld':
        ensure => stopped,
        enable => false,
    }
}
