if ( $::facts['clienttags'] =~ /installdevtools/ ) {
    include ::stdlib
    ensure_packages('gcc')
    ensure_packages('gcc-c++')
    ensure_packages('git')
    ensure_packages('make')
}
elsif ( $::facts['clienttags'] =~ /installdevtools-full/ ) {
    ensure_packages('gdb')
    ensure_packages('git-gui')
    ensure_packages('automake')
    ensure_packages('autoconf')
}

if ( $::facts['clienttags'] =~ /installLAMP/ ) {
    #
    #   ensure_packages you would like installed for LAMP server
    #
}

