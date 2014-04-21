# == Class: acng::client
#
# Configures node to use an upstream acng service
#
# === Parameters
#
#   - *server*: The upstream acng service.
#   - *ensure*: The state of the acng client
#
# === Example
#
# class { 'acng::client':
#   server => 'acng.example.com',
# }
#
class acng::client (
  $ensure = 'present',
  $server = 'localhost',
) {

  file { '/etc/apt/apt.conf.d/01apt-cacher-ng-proxy':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "Acquire::http { Proxy \"http://${server}:3142\"; };\n",
  }
}

