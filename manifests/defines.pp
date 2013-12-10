# Class stdmodule
#
# basic class skeleton
#
# used to demonstrate standard puppet resources
# - defines
#
# Author: Martin Alfke <tuxmea@gmail.com>
#
define stdmodule::defines (
){
    file { "/home/foobar/define1_${name}": # <- every resource has to be dynamic !!
        ensure => present,
    }
}
