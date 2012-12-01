apt-cacher-ng puppet module
===========================

This is a very simple apt-cacher-ng puppet module.

Usage
-----

### Server

```puppet
class { 'acng::server': }
```

### client

```puppet
class { 'acng::client':
  server => 'proxy.example.com',
}
```
