class nfs::params (
  $nfs_v4 = false,
  $nfs_v4_export_root = '/export',
  $nfs_v4_export_root_clients  = "*.${::domain}(ro,fsid=root,insecure,no_subtree_check,async,root_squash)",
  $nfs_v4_mount_root  = '/srv',
  $nfs_v4_idmap_domain = $::domain
) {

  case $::osfamily {
    'Debian': {
      case $::operatingsystem {
        'Ubuntu': {
          $portmap_service = 'portmap'
          $portmap_package = 'portmap'
          $idmap_service   = 'nfs-common'
          $idmap_package   = 'idmapd'
          $extra_packages  = ['nfs4-acl-tools']
        }
        'Debian': {
          $portmap_service = 'rpcbind'
          $portmap_package = 'rpcbind'
          $idmap_service   = 'nfs-common'
          $idmap_package   = 'nfs-common'
          $extra_packages  = ['nfs4-acl-tools']
        }
      }
    }
    default: {
      fail("Unsupported OS")
    }
  }
}
