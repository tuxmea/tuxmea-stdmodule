# Class stdmodule
#
# basic class skeleton
#
# used to demonstrate standard puppet resources
# - group
# - user
# - file
#
# Author: Martin Alfke <tuxmea@gmail.com>
#
class stdmodule::basic (
){
    # group resource
    group { 'foobar':
        ensure => present,
    }
    # user resource
    user { 'foobar':
        ensure      => present,
        gid         => 'foobar', # <- when using a string here you have to manage group too
        shell       => '/bin/bash',
        manage_home => true,
    }
    # file resource
    file { '/home/foobar/test':
        ensure  => file, # <- either use file, symlink, directory or absent
        content => "foobar\n", # <- double quotes take care on substitution
        owner   => 'foobar',
        group   => 'foobar',
        mode    => '0444',
    }
    file { '/home/foobar/test2':
        ensure => symlink,
        target => '/home/foobar/test',
    }
    file { '/home/foobar/testdir':
        ensure => directory,
        owner  => 'foobar',
        group  => 0,
    }
}
