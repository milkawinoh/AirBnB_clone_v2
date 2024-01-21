# Setup the web servers for the deployment of web_static
exec { '/usr/bin/env apt -y update' : }
-> package { 'nginx':
  ensure => installed,
}
-> file { '/data':
  ensure  => 'directory'
}
-> file { '/data/web_static':
  ensure => 'directory'
}
-> file { '/data/web_static/releases':
  ensure => 'directory'
}
-> file { '/data/web_static/releases/test':
  ensure => 'directory'
}
-> file { '/data/web_static/shared':
  ensure => 'directory'
}
-> file { '/data/web_static/releases/test/index.html':
  ensure  => 'present',
  content => "<!DOCTYPE html>
<html>
  <head>
  </head>
  <body>
    <p>Nginx server test</p>
  </body>
</html>"
}
-> file { '/data/web_static/current':
  ensure => 'link',
  target => '/data/web_static/releases/test'
}
-> exec { 'chown -R ubuntu:ubuntu /data/':
  path => '/usr/bin/:/usr/local/bin/:/bin/'
}