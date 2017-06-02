# josenk-clienttags - /etc/clienttags for a puppet managed  "self-service" environment.

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with clienttags](#setup)
    * [What clienttags affects](#what-clienttags-affects)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development](#development)

## Description

This module provides a way to give System Administrators a "self-service" 
access to puppet modules.  In some organizations, not all environments are
fully managed by the puppet team.  If you have a "self-service" environment,
you can write puppet modules that will run based on the tags managed by 
the system administrators.

Basically, you're giving systems owners the ability to tag their own servers
without access to puppet.

This module will install a text file /etc/clienttags on the puppet client.  It
can then be edited by the system owner.   The unremarked lines will be stored 
in a fact "clienttags".   Using this custom fact, you can build modules to 
provide any type of functionality the remote system administrator is requesting.

```
$ puppet facts |grep  clienttags
    "clienttags": "'installdevtools'\n'installprinting'\n'set_ssh_noknown_hosts'\n'set_tuned_performance'\n'vmware_guest'",

```

## Setup

### What clienttags affects 

This module will copy an example /etc/clienttags to your puppet clients. You
may want to customize the sample file to set some defaults or to list all 
available tags you support.

A custom fact will be created "clienttags".

## Usage

For example:

The contents of /etc/clienttags contain a line:
```
installdevtools
```


You write a puppet module to install some basic development tools.
```
class { 'do_stuff_by_clienttags':
    include ::clienttags
    if ( $::facts['clienttags'] =~ /installdevtools/ ) {
        include ::stdlib
        ensure_packages('gcc')
        ensure_packages('git')
        ensure_packages('make')
    }
}
```


## Limitations

Currently this is for Linux only.

Be careful of your REGEX!  

## Development

A new version (coming soon).  Instead of a hard-coded source, you will be
able to specify any source for the default /etc/clienttags.

## Release Notes.

v1.0.0  This is the initial release.
