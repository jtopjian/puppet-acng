#
class acng::client (
  $server,
  $ensure = present,
) {

  file { '/etc/apt/apt.conf.d/01apt-cacher-ng-proxy':
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "Acquire::http::Proxy \"http://${server}:3142\"; ",
  }
}

