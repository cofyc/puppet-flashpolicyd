class flashpolicyd($domain = "*.dev", $portrange = "*") {
  include homebrew
  include flashpolicyd::config

  file { [ 
    $flashpolicyd::config::datadir,
    $flashpolicyd::config::logdir,
    $flashpolicyd::config::configdir
  ]:  
    ensure => directory
  }

  file { $flashpolicyd::config::configfile:
    content => template('flashpolicyd/flashpolicyd.xml.erb'),
    notify  => Service['dev.flashpolicyd'],
  }

  file { '/Library/LaunchDaemons/dev.flashpolicyd.plist':
    content => template('flashpolicyd/dev.flashpolicyd.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.flashpolicyd'],
    owner   => 'root'
  }

  homebrew::formula { 'flashpolicyd':
    before => Package['boxen/brews/flashpolicyd'],
  }

  package { 'boxen/brews/flashpolicyd':
    ensure => '1.0.0-boxen1',
    notify => Service['dev.flashpolicyd']
  }

  service { 'dev.flashpolicyd':
    ensure  => running,
    require => Package['boxen/brews/flashpolicyd']
  }

  service { 'com.boxen.flashpolicyd': # replaced by dev.flashpolicyd
    before => Service['dev.flashpolicyd'],
    enable => false
  }

  file { "${boxen::config::envdir}/flashpolicyd.sh":
    content => template('flashpolicyd/env.sh.erb'),
    require => File[$boxen::config::envdir]
  }
}
