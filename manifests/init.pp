# Class: clienttags
# ===========================
#
# The "self-service" clienttags module.
#
#
# Example
# --------
#
# @example
#    class { 'do_stuff_by_clienttags':
#      include ::clienttags
#      if ( $::facts['clienttags'] =~ /installdevtools/ ) {
#        include ::stdlib
#        ensure_packages('gcc')
#        ensure_packages('git')
#        ensure_packages('make')
#      }
#    }
#
# Authors
# -------
#
# Jonathan Senkerik <josenk@jintegrate.co>
#
# Copyright
# ---------
#
# Copyright 2017 Jonathan Senkerik
#
class clienttags {

  if $::kernel == "Linux" {

    file { "/etc/clienttags": ensure => 'present',
        owner  => root, group  => wheel, mode   => '664', replace => 'false',
        source => "puppet:///modules/clienttags/clienttags",
    }
  }
}

