# == Class: acng::server
#
# Configures a node to be an acng server
#
# === Parameters
#
#   - *ensure*: The state of the acng service on the node.
#   - *enable*: To enable the service or not.
#
# === Example
#
#   class { 'acng::server': }
#
class acng::server (
  $ensure = present,
  $enable = true
) {

  package { 'apt-cacher-ng':
    ensure => $ensure,
  }

  service { 'apt-cacher-ng':
    ensure     => $ensure,
    enable     => $enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['apt-cacher-ng'],
  }

}
