# Class stdmodule
#
# basic class skeleton
#
# used to demonstrate standard puppet resources
# - resource defaults
#
# Author: Martin Alfke <tuxmea@gmail.com>
#
class stdmodule::defaults (
){

    File { # <- no title given, valid for all titles
        owner => 'foobar',
        group => 'foobar',
        mode  => '0644' # <- directories will get +1 for each non zero value 0644 -> 0755
    }
    Package {   # <- do not do that (yet). Puppet will make a single call for each package
        ensure => absent,
    }

    # overwriting defaults is possible:
    file { '/home/foobar/test3':
        ensure => file,
        owner  => 'root',
    }
}
