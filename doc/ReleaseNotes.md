<a href="https://omnios.org">
<img src="https://omnios.org/OmniOSce_logo.svg" height="130">
</a>

# Release Notes for OmniOSce v11 r151052

## r151052av (2025-10-01)
Weekly release for w/c 29th of September 2025.
> This is a non-reboot update

### Security Fixes

* OpenSSL updated to version 3.3.5

* Unsupported OpenSSL 1.0 and 1.1 packages updated to mitigate CVE-2025-9230

* Curl updated to version 8.16.0

* Expat updated to version 2.7.2

* OpenJDK packages updated to versions 1.8.462-08, 11.0.28+6, 17.0.16+8
  and 21.0.8+9

<br>

---

## r151052ar (2025-09-04)
Weekly release for w/c 1st of September 2025.
> This is a non-reboot update

### Changes

* SMB failed to authenticate to Windows Server 2025.

<br>

---

## r151052ai (2025-07-03)
Weekly release for w/c 30th of June 2025.
> This update requires a reboot

### Security Fixes

* `openssl` has been updated to version 3.3.4, fixing a low severity CVE.

* `sudo` has been updated to version 1.9.17p1, fixing two CVEs.

### Other Changes

* [ed(1)](https://man.omnios.org/man1/ed) would segfault when asked to write
  an empty file.

<br>

---

## r151052ae (2025-06-04)
Weekly release for w/c 2nd of June 2025.
> This update requires a reboot

### Security Fixes

* `curl` updated to version 8.14.0

* Intel CPU microcode updated to version 20250512

* OpenJDK packages updated to versions 1.8.452-09, 11.0.27+6, 17.0.15+6 and
  21.0.7+6

* `screen` updated to fix CVE-2025-46802, CVE-2025-46804, CVE-2025-46805

* `libxml2` updated to version 2.13.8.

* `perl` updated to 5.40.2

* `python` updated to 3.12.10

<br>

---

## r151052u (2025-03-28)
Weekly release for w/c 24th of March 2025.
> This is a non-reboot update

### Changes

- Expat library updated to version 2.7.1

<br>

---

## r151052t (2025-03-18)
Weekly release for w/c 17th of March 2025.
> This update requires a reboot

### Changes

* `tar` could create corrupt archives for large files with ACLs.

* Fix for `bhyve` e1000g network interface emulation alongside TSO.

<br>

---

## r151052p (2025-02-24)
Weekly release for w/c 17th of February 2025.
> This update requires a reboot

### Security Fixes

* OpenSSH updated to version 9.9p2, addressing
  [CVE-2025-26465](https://www.cve.org/CVERecord?id=CVE-2025-26465),
  [CVE-2025-26466](https://www.cve.org/CVERecord?id=CVE-2025-26466).

* libxml2 updated to version 2.13.6

### Other Changes

* Fix for elf header parsing in lx zones.

<br>

---

## r151052o (2025-02-11)
Weekly release for w/c 10th of February 2025.
> This is a non-reboot update

### Security Fixes

* OpenSSL updated to version 3.3.3, addressing:
  [CVE-2024-12797](https://www.openssl.org/news/vulnerabilities.html#CVE-2024-12797),
  [CVE-2024-13176](https://www.openssl.org/news/vulnerabilities.html#CVE-2024-13176),
  [CVE-2024-9143](https://www.openssl.org/news/vulnerabilities.html#CVE-2024-9143).

* Python updated to version 3.12.9.

<br>

---

## r151052n (2025-02-05)
Weekly release for w/c 3rd of February 2025.
> This update requires a reboot

### Security Fixes

* OpenJDK packages updated to versions 1.8.442-06, 11.0.26+4, 17.0.14+17 and
  21.0.6+7.

* Fix for P == Q corner case in ECC; see
  [illumos 17137](https://www.illumos.org/issues/17137).

* Curl updated to 8.12.0, addressing
  [CVE-2025-0167](https://curl.se/docs/CVE-2025-0167.html),
  [CVE-2025-0665](https://curl.se/docs/CVE-2025-0665.html),
  [CVE-2025-0725](https://curl.se/docs/CVE-2025-0725.html).

<br>

---

## r151052l (2025-01-23)
Weekly release for w/c 20th of January 2025.
> This is a non-reboot update

### Other Changes

* Updated `rsync` to 3.4.1 fixing regressions introduced in 3.4.0.

* Updated `perl` to 5.40.1.

<br>

---

## r151052k (2025-01-14)
Weekly release for w/c 13th of January 2025.
> This is a non-reboot update

### Security Fixes

- git has been updated to version 2.46.3, fixing
  [CVE-2024-50349](https://www.cve.org/CVERecord?id=CVE-2024-50349),
  [CVE-2024-52006](https://www.cve.org/CVERecord?id=CVE-2024-52006).

- rsync has been updated to version 3.4.0, fixing
  [CVE-2024-12084](https://www.cve.org/CVERecord?id=CVE-2024-12084),
  [CVE-2024-12085](https://www.cve.org/CVERecord?id=CVE-2024-12085),
  [CVE-2024-12086](https://www.cve.org/CVERecord?id=CVE-2024-12086),
  [CVE-2024-12087](https://www.cve.org/CVERecord?id=CVE-2024-12087),
  [CVE-2024-12088](https://www.cve.org/CVERecord?id=CVE-2024-12088),
  [CVE-2024-12747](https://www.cve.org/CVERecord?id=CVE-2024-12747).

<br>

---

## r151052i (2025-01-02)
Weekly release for w/c 30th of December 2024.
> This is a non-reboot update

### Security Fixes

* Updated liboqs and oqs-provider to versions 0.12.0 and 0.8.0 respectively.

### Other Changes

* Updated `developer/build/onbld` with new shadow compiler settings for
  building illumos-gate.

* Updated JSON-PP module within the perl package to treat options as
  case-sensitive.

* Updated `library/python-3/packaging-312` to support new userland build
  requirements.

<br>

---

## r151052f (2024-12-11)
Weekly release for w/c 9th of December 2024.
> This update requires a reboot

### Security Fixes

* AMD CPU microcode updated to version 20241121

* Intel CPU microcode updated to version 20241112

* Python updated to 3.12.8

### Other Changes

* Curl updated to version 8.11.1

* SCCS was not able to check out files and was missing some links in /usr/bin.
  This has been remedied.

* Coinciding with the illumos project's
  [shift to using gcc 14 as the new shadow compiler](https://illumos.topicbox.com/groups/developer/T71928f9a75a9072b-Me061567b7ec00c399231018d/heads-up-gcc-14-will-be-the-new-shadow-compiler-wednesday)
  this is now included in the `illumos-tools` bundle.

* An issue with cloning ipkg-based zones due to OpenSSH DSA deprecation has
  been resolved - see https://github.com/omniosorg/pkg5/pull/503

<br>

---

## r151052c (2024-11-20)
Weekly release for w/c 18th of November 2024.
> This is a non-reboot update

### Security Fixes

- `curl` updated to version 8.11.0

- `expat` updated to version 2.6.4

- `wget` updated to version 1.25.0

- OpenJDK packages updated to versions 1.8.432-06, 11.0.25+9, 17.0.13+11 and
  21.0.5+11.

<br>

---

## r151052b (2024-11-18)

This release is a respin of the installation media to correct a problem with
the dialogue-based installer; there are no other changes.

<br>

---

Stable Release, 4th of Nov 2024

`uname -a` shows `omnios-r151052-dbe4644ba92`

r151052 release repository: https://pkg.omnios.org/r151052/core

## Upgrade Notes

Upgrades are supported from the r151046, r151048 and r151050 releases
only. If upgrading from an earlier version, upgrade in stages, referring to the
table at <https://omnios.org/upgrade>.

## New features since r151050

### System Features

* It is now possible for the `cpqary3` and `smrt` drivers to co-exist on a
  system, and to switch devices which are supported by both over to using
  the newer `smrt`. This is done by changing a variant to enable the device
  aliases in the smrt driver. This can be done as a single step in a new
  temporarily activated boot environment (to allow easy rollback) with
  something like:
  ```bash
  pkg change-variant --be-name=smrt --temp-be-activate smrt.aliases=true
  init 6
  ```

* OpenSSL 3 now has support for the
  [open-quantum-safe](https://openquantumsafe.org/) provider.

* SMF services which start as root and user to have their initial working
  directory set to root's home directory (`/root`) now start in `/`. This
  allows `/root` to be a separate ZFS dataset.

* Some services which can only partially succeed can now enter the degraded
  state where they will not block dependencies from coming online. For example,
  the service which mounts all filesystems during boot will enter this state if
  any filesystem fails to mount, but dependencies such as the ssh service can
  still start, allowing easier access to resolve the problem.

* The encryption feature in SMB3 is now supported by the SMB client.

### Commands and Command Options

* [`false(1)`](https://man.omnios.org/man1/false) no longer exits with a status
  of 255. While previously allowed by POSIX, the latest standard prohibits
  any exit status over 128, and some external software goes further and expects
  this to be exactly `1`. Such (incorrect) software will now be sated.

* The `rsync` command now supports IPv6.

* `cp` and `mv` now support the `-n` option.

* `ln` now supports `-i`.

* The `base32` command has been added to the `gnu-coreutils` package.

* [`smbadm`](https://man.omnios.org/smbadm) has grown a new `-s` option to
  display SIDs instead of names when enumerating group memberships.

* The [find(1)](https://man.omnios.org/find) command now supports selecting
  files via SID.

* [ptree(1)](https://man.omnios.org/ptree) with the `-g` option is now more
  willing to use UTF-8 box characters.

* system/library/mozilla-nss now includes the NSS test client (`tstclnt`).

* The fault management `fmdump` utility has been updated to support more
  complex property filters and the [man page](https://man.omnios.org/fmdump)
  has been expanded to document options such as -A, -a, -H, -j and -p.

* [nc(1)](https://man.omnios.org/nc) now supports options to set the
  outgoing and minimum TTL, to add a traffic class for IPv6 sockets, and
  to enable TCP MD5.

* [savecore(8)](https://man.omnios.org/savecore) now reports progress whilst
  saving compressed dumps.

* [diskinfo(8)](https://man.omnios.org/diskinfo) shows disk serial numbers
  in more cases.

* The [pwdx(1)](https://man.omnios.org/pwdx) command can now be used on
  core files.

* [dumpadm(8)](https://man.omnios.org/dumpadm) has new `-H` and `-p` flags for
  parsable output.

* [nvmeadm(8)](https://man.omnios.org/nvmeadm) has been extended to support
  more device/vendor-specific commands, and with commands to access a drive's
  persistent event log.

* `cxgbetool` now supported general register reads and writes.

* mdb's `disk_label mbr` command now includes details of the BIOS parameter
  block in its output.

### Libraries and Library Functions

* Support for `FD_CLOFORK` (an `FD_CLOEXEC` analogue) and related features
  has been added. illumos [issue 16624](https://www.illumos.org/issues/16624)
  has further details.

* A number of new functions for specifying a particular clock type when
  phrasing an absolute timeout with mutex, condition variable and rwlock
  functions have been added -- see
  [pthread_mutex_clocklock(3C)](https://man.omnios.org/pthread_mutex_clocklock),
  [pthread_rwlock_clockwrlock(3C)](https://man.omnios.org/pthread_rwlock_clockwrlock),
  [pthread_rwlock_clockrdlock(3C)](https://man.omnios.org/pthread_rwlock_timedrdlock),
  [pthread_cond_clockwait(3C)](https://man.omnios.org/pthread_cond_clockwait).

* [syncfs(3C)](https://man.omnios.org/syncfs) has been added.

* New `strerrordesc_np` and `strerrnorname_np` functions - see
  [strerror(3C)](https://man.omnios.org/strerror).

* [pts_name_r(3C)](https://man.omnios.org/ptsname_r) is now available.

* Support for decoding SMBIOS additional information (type 40) records.

* libjedec has been enhanced with support for LPDDR3-5, DDR5 and newer
  versions of the specification.

### Networking

* The `IP_MINTTL` and `IPV6_MINHOPCOUNT` socket options are now supported for
  IPv4 and IPv6 (respectively) TCP, UDP, SCTP, and raw IP sockets.

* The `TCP_MD5SIG` option is now supported. This is commonly used as an
  additional authentication layer for BGP connections. This is configured
  via the new [tcpkey(8)](https://man.omnios.org/tcpkey) utility and a
  persistent configuration can be placed in `/etc/inet/secret/tcpkeys`. There
  is a new `Network TCP Key Management` rights profile that enables running
  `tcpkey` via `pfexec`, and to manage the tcpkey service.

* The `SO_SNDTIMEO` and `SO_RCVTIMEO` options were broken for UNIX domain
  sockets. This has been rectified.

* The `SO_PROTOCOL` socket option is now defined. This is the POSIX name for
  the pre-existing `SO_PROTOTYPE`.

* It is now possible to provide a MAC address via `dladm` when creating a
  simnet.

### Zones

### LX zones

* Support for simple (covering whole file) OFD locks has been added.

* The `TCP_INFO` socket option is no longer permitted on UNIX domain sockets.

### Bhyve

* If necessary, bhyve can be started without enabling the BARS in guest PCI
  devices. This is not generally what you want but can be useful for (exotic)
  guests that do not expect the hypervisor to have done this.

### ZFS

* ZFS now includes optimised fletcher-4 checksum implementations that can take
  advantage of SSE / AVX2 / AVX-512.

* Reference count tracking (used when debugging ZFS) has been switched from
  using lists to AVL trees, significantly reducing the overhead of having it
  enabled.

* The `::zfs_dbgmsg` kmdb command now supports new `-t` and `-T` options for
  displaying times alongside messages from the log ringbuffer.

### Package Management

* A synthetic `pkg.fmri.name` attribute is now available to IPS transforms.
  This is the name of the package, without any scheme, publisher name or
  version information, e.g. `library/libxml2`.

### Hardware Support

* Initial support for AMD Turin and the Zen 5 micro-architecture.

* Support for the Broadcom / LSI Fusion-MPT SAS38xx cards has been added to the
  `mpt_sas` driver.

* Improved support for PCI(e) UART devices with higher baud rates and larger
  FIFOs.

* The `cxgbe` firmware bundled in the driver has been updated to version
  1.27.5.0

* Several improvements have been made to the NVMe firmware update process
  via nvmeadm / libnvme.

* The `nvme` driver has better tracking of admin commands issued to NVMe
  controllers and will take account of queue depth when considering whether
  commands have timed out. There are also some additional kstats for each
  NVMe device that show latency across several command groups. Internal driver
  counters have also been promoted to kstats.

* It is now possible to disable a `cxgbe` chip's internal parser to allow
  L2/L3 encapsulations not supported by the ASIC. This is done via the new
  `CPL_TX_PKT_XT` opcode.

### Virtualisation

* The number of network adapters that can be added to a bhyve VM has been
  increased from 8 to 16.

* The `viona` networking driver now has kstats for various statistics.

* When running as a guest, OmniOS is now more willing to use clock information
  from the hypervisor. This improves compatibility with recent AWS instance
  types.

### Developer Features

* The `_XOPEN_SOURCE` macro value is no longer ignored in the presence of
  `__XOPEN_SOURCE_EXTENDED`. This helps when building third party software
  that sets the latter variable.

* The GCC 14 compiler is available and used by default to build OmniOS
  userland. This compiler contains the patches from the
  [illumos gcc-14.2.0-il-1 tag](https://github.com/illumos/gcc/tree/il-14_2_0)

* GCC 10 has been updated with the latest set of illumos-specific patches.

* Both gcc10 and gcc14 now support the use of `%j` and `%z` in the kernel,
  support for which was added in
  [illumos 16768](https://www.illumos.org/issues/16768).

* GCC 12 has been retired. The package will remain installed if you are
  upgrading from a previous version, but will receive no more updates.

* An illumos C style guide is now provided as
  [a man page](https://man.omnios.org/style).

* SMF services can enter a degraded state via their exit value, or be marked
  as degraded by another service. This allows services to flag themselves for
  administrator intervention without blocking all dependent services from
  starting.

* A kernel test framework is available, allowing easier development of
  tests in kernel code. See [ktest(9)](https://man.omnios.org/man9/ktest) for
  more information.

### Deprecated features

* The `/usr/share/pci.ids` file is no longer shipped and the associated
  package (system/pciutils/pci.ids) is obsolete. This file was a duplicate of
  `/usr/share/hwdata/pci.ids` which should be used instead.

* The `grub` boot loader is deprecated and has been removed in the r151048
  release. It will be supported in r151046 for the full LTS time frame, up to
  May 2026. If you have not yet migrated to the new boot loader, and would like
  assistance, please
  [get in touch](https://omnios.org/about/contact).

* OpenSSL 1.0.x and 1.1.1 are deprecated and reached end-of-support at the end
  of 2019 and in September 2023 respectively.
  OmniOS has transitioned to OpenSSL 3 and still ships older versions for
  backwards compatibility, but these are maintained solely on a best-efforts
  basis. If possible, recompile software to use OpenSSL 3.

* Python 2 is now end-of-life and will not receive any further updates. The
  `python-27` package is still available for backwards compatibility but will
  be maintained only on a best-efforts basis.

### Package changes

| Package | Old Version | New Version |
| :------ | :---------- | :---------- |
| compress/lz4 | 1.9.4 | 1.10.0
| compress/zstd | 1.5.5 | 1.5.6
| data/iso-codes | 4.16.0 | 4.17.0
| database/sqlite-3 | 3.45.2 | 3.46.1
| developer/build/automake | 1.16.5 | 1.17
| ~~developer/gcc12~~ | 12.3.0 | _Removed_
| developer/gcc13 | 13.2.0 | 13.3.0
| **developer/gcc14** | _New_ | 14.2.0
| developer/gnu-binutils | 2.42 | 2.43.1
| developer/macro/cpp | 20220808 | 20240422
| developer/nasm | 2.16.1 | 2.16.3
| developer/versioning/git | 2.44.2 | 2.46.2
| developer/versioning/mercurial | 6.7 | 6.8.1
| **driver/ktest** | _New_ | 0.5.11
| editor/vim | 9.0.2136 | 9.1.652
| file/gnu-coreutils | 9.4 | 9.5
| file/gnu-findutils | 4.9.0 | 4.10.0
| library/glib2 | 2.80.0 | 2.82.1
| library/libxml2 | 2.12.6 | 2.13.4
| library/libxslt | 1.1.30 | 1.1.42
| library/ncurses | 6.4.20240309 | 6.5.20240511
| library/nghttp2 | 1.60.0 | 1.63.0
| library/pcre2 | 10.43 | 10.44
| library/python-3/attrs-312 | 23.2.0 | 24.2.0
| library/python-3/cffi-312 | 1.16.0 | 1.17.0
| library/python-3/coverage-312 | 7.4.3 | 7.6.1
| library/python-3/cryptography-312 | 42.0.5 | 43.0.0
| library/python-3/idna-312 | 3.6 | 3.7
| library/python-3/jsonrpclib-312 | 0.4.3.2 | 0.4.3.3
| library/python-3/meson-312 | 1.4.0 | 1.5.1
| library/python-3/orjson-312 | 3.9.15 | 3.10.7
| library/python-3/packaging-312 | 24.0 | 24.1
| library/python-3/pip-312 | 24.0 | 24.2
| library/python-3/pycodestyle-312 | 2.11.1 | 2.12.1
| library/python-3/pycparser-312 | 2.21 | 2.22
| library/python-3/pyopenssl-312 | 24.1.0 | 24.2.1
| library/python-3/pyyaml-312 | 6.0.1 | 6.0.2
| library/python-3/rapidjson-312 | 1.16 | 1.20
| library/python-3/setuptools-312 | 69.1.1 | 73.0.1
| library/python-3/setuptools-rust-312 | 1.9.0 | 1.10.1
| library/python-3/typing-extensions-312 | 4.10.0 | 4.12.2
| library/readline | 8.2 | 8.2.13
| **library/security/liboqs** | _New_ | 0.10.1
| library/security/openssl | 3.1.7 | 3.3.2
| library/security/openssl-3 | 3.1.7 | 3.3.2
| **library/security/oqs-provider** | _New_ | 0.6.0
| network/dns/bind | 9.18.24 | 9.18.30
| network/openssh | 9.7.1 | 9.9.1
| network/openssh-server | 9.7.1 | 9.9.1
| network/rsync | 3.2.7 | 3.3.0
| network/socat | 1.8.0.0 | 1.8.0.1
| network/test/iperf | 3.1.3 | 3.17.1
| runtime/perl | 5.38.2 | 5.40.0
| runtime/python-312 | 3.12.6 | 3.12.7
| security/sudo | 1.9.15.5 | 1.9.16
| shell/bash | 5.2.26 | 5.2.32
| shell/pipe-viewer | 1.8.5 | 1.8.14
| shell/tcsh | 6.24.11 | 6.24.13
| system/library/g++-runtime | 13 | 14
| system/library/gcc-runtime | 13 | 14
| system/library/gfortran-runtime | 13 | 14
| system/library/gobjc-runtime | 13 | 14
| system/library/mozilla-nss | 3.99 | 3.105
| system/library/pcap | 1.10.4 | 1.10.5
| system/pciutils | 3.11.1 | 3.13.0
| ~~system/pciutils/pci.ids~~ | 2.2.20240331 | _Removed_
| system/rsyslog | 8.2402.0 | 8.2408.0
| **system/test/epolltest** | _New_ | 20240808
| system/test/fio | 3.36 | 3.37
| **system/test/libproctest** | _New_ | 0.5.11
| **system/test/libsectest** | _New_ | 0.5.11
| system/virtualization/open-vm-tools | 12.3.5 | 12.4.5
| terminal/tmux | 3.4 | 3.5
| text/gawk | 5.3.0 | 5.3.1
| text/less | 643 | 661
| web/curl | 8.9.1 | 8.10.1

