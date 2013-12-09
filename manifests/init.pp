# Class stdmodule
#
# basic class skeleton
#
# used to demonstrate standard puppet resources
#
# Author: Martin Alfke <tuxmea@gmail.com>
#
class stdmodule (
    $myparam = hiera('stdmodule::myparam', 'foo')
){
    include stdmodule::basic
    include stdmodule::package_file_service
}
