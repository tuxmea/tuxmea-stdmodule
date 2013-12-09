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
class stdmodule::child inherits stdmodule::parent (
){
    File ['/home/foobar/parent'] {  # <- we need to overwrite a reference on a special title
        ensure  => absent,
        require => File['/home/foobar/parent/file1'],  # <- we need to take care on reverse order
    }
    File ['/home/foobar/parent/file1'] {
        ensure  => absent,
        require => File['/home/foobar/parent/file2'],
    }
    File ['/home/foobar/parent/file2'] {
        ensure => absent,
        target => undef, # <- we need to set parameters to undefine to allow absent
    }
}
