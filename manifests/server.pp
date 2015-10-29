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
  $ensure = 'present',
  $enable = true,
  $admin_user = undef,
  $admin_pass = undef
) {

  package { 'apt-cacher-ng':
    ensure => $ensure,
  }

  if $enable {
    $service_ensure = 'running'
  } else {
    $service_ensure = 'stopped'
  }

  service { 'apt-cacher-ng':
    ensure     => $service_ensure,
    enable     => $enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['apt-cacher-ng'],
  }

  file { '/etc/apt-cacher-ng/security.conf':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'apt-cacher-ng',
    mode    => '0640',
    content => "AdminAuth: ${admin_user}:${admin_pass}\n",
  }
}
