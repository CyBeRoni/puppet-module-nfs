class nfs::client::debian::install {
  
  package {$nfs::params::portmap_package:
    ensure => installed,
  }

  package {$nfs::params::idmap_package:
    ensure => installed,
  }

  package {$nfs::params::extra_packages:
    ensure => installed,
  }

}
