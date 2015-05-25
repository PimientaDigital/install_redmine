class pip {
    package { 'python-pip':
        ensure => installed,
        require => Exec["manager update"],
    }
}
