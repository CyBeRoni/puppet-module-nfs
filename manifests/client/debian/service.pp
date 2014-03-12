class nfs::client::debian::service {

  Service{
    require => Class['nfs::client::debian::configure']
  }

  service { $nfs::params::portmap_service:
    ensure    => running,
    enable    => true,
    hasstatus => false,
  }

  if $nfs::client::debian::nfs_v4 {
    $ensure_idmapd = 'running'
    $subscribe = Augeas[ '/etc/idmapd.conf', '/etc/default/nfs-common' ]
  } else {
    $ensure_idmapd = 'stopped'
  }

  service { $nfs::params::idmap_service:
      ensure    => $ensure_idmapd,
      subscribe => $subscribe,
  }
}
