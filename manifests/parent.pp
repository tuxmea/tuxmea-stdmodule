# Class stdmodule
#
# basic class skeleton
#
# used to demonstrate standard puppet resources
#
# parent class to show inheritance
#
# Author: Martin Alfke <tuxmea@gmail.com>
#
class stdmodule::parent (
){
    file { '/home/foobar/parent':
        ensure => directory,
    }
    file { '/home/foobar/parent/file1':
        ensure => file,
    }
    file { '/home/foobar/parent/file2':
        ensure => link,
        target => '/home/foobar/parent/file1',
    }
}
