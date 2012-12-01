#
class acng::server (
  $ensure = present,
  $enable = true
) {

  package { 'apt-cacher-ng':
    ensure => $ensure,
  }

  service { 'apt-cacher-ng':
    enable     => $enable,
    ensure     => $enable,
    hasrestart => true,
    hasstatus  => true,
    require    => Package['apt-cacher-ng'],
  }

}
