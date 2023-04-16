<a href="https://omnios.org">
<img src="https://omnios.org/OmniOSce_logo.svg" height="128">
</a>

# Release Notes for OmniOSce v11 r151046

## $\color{red}{These\ are\ DRAFT\ release\ notes}$

Stable Release, TBC of May 2023

`uname -a` shows `omnios-r151046-XXX`

r151046 release repository: https://pkg.omnios.org/r151046/core

## Upgrade Notes

Upgrades are supported from the r151038, r151040, r151042 and r151044 releases
only. If upgrading from an earlier version, upgrade in stages, referring to the
table at <https://omnios.org/upgrade>.

## New features since r151044

### System Features

### Commands and Command Options

* csh mediator

### Libraries and Library Functions

### Zones

### LX zones

### Bhyve

### ZFS

### Package Management

### Hardware Support

### Installer

### Virtualisation

### Developer Features

### Deprecated features

* OpenSSH in OmniOS no longer provides support for GSSAPI key exchange.
  This was removed in release r151038.

* Python 2 is now end-of-life and will not receive any further updates. The
  `python-27` package is still available for backwards compatibility but will
  be maintained only on a best-efforts basis.

* OpenSSL 1.0.x is deprecated and reached end-of-support at the end of 2019.
  OmniOS has transitioned to OpenSSL 3 and still ships OpenSSL 1.1.1 for
  compatibility. The OpenSSL 1.0.2 libraries are also retained for
  backwards compatibility but are maintained solely on a best-efforts basis.

### Package changes

