# vas_local_user

[![Build Status](https://api.travis-ci.org/anders-larsson/puppet-module-vas_local_user.png)](https://travis-ci.org/anders-larsson/puppet-module-vas_local_user)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with vas_local_user](#setup)
    * [What vas_local_user affects](#what-vas_local_user-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with vas_local_user](#beginning-with-vas_local_user)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

This module allows you to manage both users and ssh_authorized_keys on systems
using QAS/VAS. The thought behind it is make it easier for you to create users
on systems with and without QAS installed.

## Module Description

The module makes sure that this user is created before the system
is connected to QAS on new installations. It does not manage the users and/or
ssh_authorized_keys at all right now in cases where QAS is already installed.

## Setup

### What vas_local_user affects

* It affects the users and ssh_authorized_keys it's configured to manage.

### Beginning with vas_local_user

If the module is included in the catalogue but not configured in any way it
does not do anything. It takes in total four different parameters.

The following defaults are used when creating a user.

Not using QAS:
  'manage_home' => true

Using QAS:
  'forcelocal'  => true
  'before'      => Class['vas']

## Usage

### users

A hash of all users the module should manage/create.

- *Default*: undef

### ssh_keys

A hash of all ssh_authorized_keys the module should manage/create.

- *Default*: undef

### users_hiera_merge

Set to true to enable hiera_merge for parameter 'users'.

- *Default*: false

### groups_hiera_merge

Set to true to enable hiera_merge for parameter 'groups'.

- *Default*: false

## Reference

Classes:

* vas_local_user

## Limitations

This module uses before on Class['vas'] to guess whether QAS is in the catalogue
or not. This module has been tested in combination with Ericsson/puppet-module-vas.

Requires Puppet >=3.2 since it uses User type's parameter forcelocal.

## Development

Please make changes atomic. Rebase your commits if neccessary to make it atomic.