<a href="https://omnios.org">
<img src="https://omnios.org/OmniOSce_logo.svg" height="128">
</a>

# Release Notes for OmniOSce v11 r151060

## $\color{red}{\textit{These are DRAFT release notes}}$

<!-- surveyed: omnios-build d349e22a4, illumos 4bcef2d4118, pkg5 6072ee9b1, kayak 23e2d98 -->

Stable Release, TBC of November 2026

`uname -a` shows `omnios-r151060-TBC`

r151060 release repository: https://pkg.omnios.org/r151060/core

## Upgrade Notes

Upgrades are supported from the r151054, r151056 and r151058 releases
only. If upgrading from an earlier version, upgrade in stages, referring to the
table at <https://omnios.org/upgrade>.

This release introduces a new format for IPS package images which
brings significant performance improvements - see
[Package Management](#package-management) below. Existing images are not
upgraded automatically. Once the system has been upgraded, and once you are
satisfied that you will not need to boot back into an earlier release, run
`pkg update-format` to upgrade the image format and benefit fully from the
improvements. If you have non-global zones, you can update them all at the
same time with `pkg update-format -r` and the usual `-z` and `-Z` options
are supported if you wish to limit the scope.

## New features since r151058

### Package Management

* The IPS packaging system has received significant performance improvements.
  Amongst the highlights are:

  * installing or removing a single small package takes around 35% of the
    time it previously did;
  * memory usage is dramatically reduced - `pkg list -a` on a large
    package repository uses around a tenth of the memory it did before, and
    planning a large update around 40% less;
  * the local search index is updated incrementally as packages change,
    instead of periodically requiring a slow full rebuild;
  * all `pkg` invocations start faster.

* The package dependency solver is faster, particularly on images with
  large package catalogues. When an operation cannot be satisfied, it now
  also produces a concise summary of the root cause instead of many pages
  of cascading rejections; the full detail remains available via the `-v`
  option.

* These improvements come with a new image format, version 5. Newly created
  images, including newly installed systems and newly created zones, use
  the new format automatically. Existing images continue to work, but must
  be explicitly upgraded to the new format in order to see the full benefit.
  This is not done automatically since, once upgraded, an image can no
  longer be managed by older versions of the packaging software. Run
  [pkg update-format](https://man.omnios.org/man1/pkg) to upgrade the global
  zone image, or `pkg update-format -r` to upgrade any installed non-global
  zones at the same time. `pkg` displays a reminder after operations on an
  image which is still in the old format.

* `pkg` no longer incorrectly reports a partial failure when the currently
  selected implementation of a mediated link (such as `/usr/bin/python`) is
  removed while another installed implementation satisfies the link.

* `pkg update -n` now returns the correct exit code when a dry run finds
  that there is insufficient disk space in a non-global zone, and
  insufficient space during a dry run is reported as a message instead of
  an error.

### System Features

* The NFS server now supports delegations when serving NFSv4.1, including
  the session back-channel used to recall them. This improves client caching
  behaviour and performance for NFSv4.1 mounts.

* The SMB client now supports SMB protocol version 3.1.1, and a number of
  problems with the [smbfs(4FS)](https://man.omnios.org/smbfs) client have
  been fixed, including a rename failure with some SMB2 servers.

* SMF service methods can now exit with the new `SMF_EXIT_TEMP_DISABLE` code
  to request that the service be temporarily disabled until the next system
  boot; see [smf_method(7)](https://man.omnios.org/smf_method).

* All userland packages are now built so that programs and libraries use the
  thread-safe, per-thread `errno` and `h_errno` variables instead of the
  historical global variables, which could return stale values when used
  from any thread other than the first.

* The `/dev` symbolic link database is now integrity-checked when loaded,
  and duplicate entries no longer accumulate in it indefinitely, fixing a
  source of slow boot-time device enumeration on long-lived systems.

* Initial system clock (TSC) calibration is more accurate on systems where
  the HPET is used as the reference timer, improving timekeeping precision
  from boot.

* The `cpu_info` kstat now includes the APIC ID of each processor.

* [strftime(3C)](https://man.omnios.org/strftime) no longer returns stale
  timezone abbreviations after the timezone is changed, and can no longer
  access freed memory when another thread calls `tzset()` at the same time.

* The `pfexecd` daemon now limits the size of the door thread pool.

* A panic in the kernel terminal emulator caused by console messages sent
  while the console keyboard or display was being reconfigured has been
  fixed.

### Commands and Command Options

* The [cp(1)](https://man.omnios.org/cp), [mv(1)](https://man.omnios.org/mv)
  and [ln(1)](https://man.omnios.org/ln) utilities now accept a `-T` option
  to treat the target as a file instead of a directory, and `ln` now also
  supports the POSIX `-L` and `-P` options to control whether a symbolic
  link source is followed.

* The [rm(1)](https://man.omnios.org/rm) utility now supports `-d` to remove
  empty directories and `-v` to report each removal as it happens.

* The [pwd(1)](https://man.omnios.org/pwd) utility now supports the POSIX
  `-L` and `-P` options for reporting the logical or physical working
  directory.

* The [du(1)](https://man.omnios.org/du) utility now has a `-A` option to
  show the apparent size of files instead of the disk blocks they occupy,
  and a `-b` option to report sizes in bytes. These are useful on
  filesystems which employ compression, or in the presence of sparse files.

* The [ps(1)](https://man.omnios.org/ps) utility has a new `-m` option
  which reports per-process (or, together with `-L`, per-thread) microstate
  accounting information - time spent in user mode, system mode, page
  faults, lock waits and so on - along with corresponding new `-o` output
  fields.

* When capturing to a file, [snoop(8)](https://man.omnios.org/snoop) now
  reports the number of packets lost during the capture.

* The `pcieadm` utility now shows device location information in
  `show-devs` output. The old private `pcieb` tool has
  been merged into it, adding subcommands for retraining PCIe links and
  managing their speed.

* Several utilities - [find(1)](https://man.omnios.org/find),
  [xargs(1)](https://man.omnios.org/xargs) and
  [make(1S)](https://man.omnios.org/make) - now use `posix_spawn()` to
  launch commands, making them faster, particularly when run from a large
  process.

* GNU [screen(1)](https://man.omnios.org/screen) has been updated to
  version 5.0.2, a major new upstream release.

### Libraries and Library Functions

* The [posix_spawn(3C)](https://man.omnios.org/posix_spawn) family is
  now implemented in the kernel and is significantly faster. It no longer needs
  to suspend the parent's threads or copy the parent's address space metadata
  when starting a new process.

* libc now provides the C23 `char8_t` conversion functions
  [mbrtoc8(3C)](https://man.omnios.org/mbrtoc8) and
  [c8rtomb(3C)](https://man.omnios.org/c8rtomb), along with `_l` locale
  variants of the full `uchar.h` family. The `char16_t` and `char32_t`
  functions now always operate on Unicode, as the standard requires.

* The [libscf(3LIB)](https://man.omnios.org/libscf) library now provides new
  administrative functions which operate directly on an `scf_instance_t`
  handle, such as `smf_enable_instance_by_instance()`, together with
  `smf_refresh_all_instances()` and `smf_get_state_by_instance()`.

* [getifaddrs(3SOCKET)](https://man.omnios.org/getifaddrs) now returns
  properly formed `AF_LINK` entries, with the interface type and name filled
  in to the `sockaddr_dl` structure, improving compatibility with software
  ported from other platforms.

* Assorted libc correctness fixes: `duplocale()` correctly copies the locale
  name; exiting threads no longer free their per-thread locale out from
  under `uselocale()` consumers; and `getmntent()` no longer falls back to
  parsing `/etc/mnttab` as plain text after a transient error.

### Networking

* IPv4 addresses in RFC 1918 private ranges are no longer treated as
  site-local for the purposes of RFC 6724 destination address selection,
  fixing cases where IPv6 destinations were incorrectly de-prioritised on
  dual-stack systems using private IPv4 addressing.

* Several long-standing problems with datalink bandwidth limits (`maxbw`)
  have been fixed. Setting or removing a limit can no longer block or freeze
  transmission on a link, and low configured bandwidths no longer risk
  stopping traffic entirely.

* A panic when re-adding a previously removed interface to a link
  aggregation has been fixed.

* The `cxgbe` driver for Chelsio Terminator network interfaces now supports
  multiple MAC rings and more receive and transmit queues, improving
  throughput on these adapters.

* The `vioif` virtio network driver now supports multiple queue pairs,
  allowing network traffic in virtual machines to scale across multiple
  vCPUs. A number of smaller vioif and virtio framework bugs have been
  fixed at the same time.

* A hang in the `i40e` driver, where a transmit ring could freeze
  when passed an invalid MSS value, has been fixed.

### Zones

* bhyve-branded zones support a new `bootdiskif` attribute, which allows the
  disk interface model for the boot disk to be selected independently of the
  other disks, and new `comN` attributes for configuring additional COM
  ports beyond the console.

* emu-branded zones can now pass custom options to the network backend.

* The `timerfd` device is now available within non-global zones, allowing
  software which uses
  [timerfd_create(3C)](https://man.omnios.org/timerfd_create) to run there.

### ZFS

* The new `zpool wait` command blocks until background pool activity -
  scrub, resilver, device replacement, initialisation, checkpoint discard or
  asynchronous freeing - has completed, and can also display the progress of
  such activity at intervals. In support of this, `zpool scrub`,
  `zpool replace`, `zpool attach`, `zpool initialize` and
  `zpool checkpoint --discard` now take a `-w` flag to wait for the
  operation to finish. See [zpool(8)](https://man.omnios.org/zpool).

* Raising or removing a ZFS quota is now always permitted, even when the
  dataset is over the current quota.

* A number of stability fixes have been incorporated. A panic which could occur
  when decompressing gzip-compressed data under low memory conditions, a panic
  when running `zpool split` on certain pool layouts, and an unhelpful error
  when creating a pool on a plain file when the file size is not a multiple of
  the sector size have all been fixed.

### Bhyve

* The `viona` para-virtualised network device now offers IPv6 TSO offload to
  guests, improving IPv6 transmit performance, and no longer interrupts the
  guest when none of the received packets could be delivered.

* The bhyve virtio-console device now defers port-name announcements until
  the guest signals that it is ready, fixing lost console names with some
  guests.

* bhyve now produces diagnostic messages when guest drivers misbehave,
  making guest problems easier to debug, and the virtio-scsi and XHCI (USB)
  device models have been updated with fixes from FreeBSD.

* Several important stability fixes have been made to the bhyve kernel
  module, including in the areas of nested page table handling, AMD ASID
  management and guest memory unmapping.

### Hardware Support

* OmniOS now correctly identifies the Hyper-V VMBus device when running as a
  guest on Windows Server 2025.

* The system fault-management topology now includes a full PCIe device tree,
  and DIMM identification has been improved. The JEDEC vendor database has
  been updated, DDR5 SPD 1.4 and LPDDR5 SPD 1.3 are supported, and 3DS RDIMM
  module properties are exposed. Topology enumeration failures on some AMD
  systems have also been fixed.

* Smart-card readers which support automatic parameter negotiation now work
  with the `ccid` driver, and `ccidadm list` now explains why a reader is
  shown as unsupported.

* The kernel sensor framework has received a series of fixes making sensor
  devices more reliable across driver attach and detach.

* The `ahci` SATA driver now handles buggy hardware emulators more
  gracefully, improving operation under some hypervisors.

### NVMe

* Kernel NVMe support has been updated for the NVMe 2.3 specification, with
  new log pages, features and error codes. The driver is also more robust -
  it now polls the admin completion queue when a command times out, so that
  lost interrupts no longer fail otherwise successful commands, and it logs
  the full controller status if the controller reports a fatal error early
  in attach.

* The [nvmeadm(8)](https://man.omnios.org/nvmeadm) utility has been extended
  with many new capabilities:
  * new `measure-phyeye` and `report-phyeye` subcommands for capturing and
    rendering PCIe PHY eye diagrams on supported devices;
  * a new `print-logpage` subcommand with parsable, filterable output for
    decoding log pages;
  * a new `set-feature` subcommand, along with support for getting and
    setting vendor-specific features;
  * `list` can now show physical device locations;
  * decoding of many more log pages, including extended SMART, supported
    commands and features, NVMe-MI, and vendor logs from OCP, Western
    Digital, Micron and Solidigm devices.

### Storage

* The `mpt_sas` driver can now issue writes larger than 1MiB.

### Modular Debugger

* [mdb(1)](https://man.omnios.org/mdb) shell escapes have been substantially
  enhanced. A quote-delimited shell command can now form a stage of a dcmd
  pipeline (for example `::walk thread ! 'head -10' | ::findstack`), can
  be used at the head of a pipeline to generate addresses from an external
  program, and the new `!<` sequence evaluates the output of a shell command
  as debugger commands.

* mdb kernel modules no longer hard-code the maximum CPU count, and the
  kernel debugger correctly identifies processors with IDs above 255, fixing
  debugging on systems with very large numbers of processors.

### Boot Loader

* The illumos boot loader can now be built as `userboot.so`, a shared object
  which allows a host program - such as a bhyve loader process - to boot an
  illumos or other guest directly without firmware.

* Assorted fixes: the EFI loader has a larger dedicated heap for command
  processing, the full cursor state is saved and restored around loader
  screen updates, and the in-memory boot archive is always rebuilt from scratch.

### Installer

* Installations driven by a profile which lists many packages are now
  noticeably faster, as all of the packages are installed in a single
  `pkg install` invocation.

### Developer Features

* Perl has been updated to version 5.44. Perl extension modules are now
  built to the XPG6 standard and linked via the compiler driver, improving
  compatibility for modules which use compiler support routines, and the
  bundled `Sun::Solaris` modules have been updated to build and run cleanly
  with modern perl.

* Many developer tools have been updated, including GNU binutils 2.47,
  libtool 2.6.2, autoconf 2.73, nasm 3.02, swig 4.5.0, GNU gettext 1.0 and
  git 2.55.

* The libevent library, which was previously bundled privately with tmux, is
  now delivered as a standalone `library/libevent` package.

* The system linker now merges `.gcc_except_table` sections, fixing C++
  exception handling in objects produced by newer GCC releases.

* C and C++ header compatibility has been improved. C11 `thread_local` no
  longer conflicts with the C++ keyword, C99 maths functions are correctly
  visible to C++ code, and `rpc/xdr.h` no longer pulls in `stdio.h`.

* New DDI interfaces are available for driver authors. These include
  [ddi_ncpus_expected(9F)](https://man.omnios.org/ddi_ncpus_expected) for
  sizing per-CPU resources,
  [msgpullup_pad(9F)](https://man.omnios.org/msgpullup_pad) for pulling up
  STREAMS messages with padding, and
  [uio_copyin(9F)](https://man.omnios.org/uio_copyin) and
  [uio_copyout(9F)](https://man.omnios.org/uio_copyout) for copying data
  between userland and the kernel via a `uio_t`.

* Many manual pages have been added or substantially improved, including new
  pages for the userland `mutex_enter()` family and `door_xcreate(3C)`.

* The `library/python-3/orjson-313` package has been removed. It will remain
  installed if upgrading from a previous release, but will receive no
  further updates.

### Deprecated features

* The `grub` boot loader is deprecated and was removed in the r151048
  release. If you have not yet migrated to the new boot loader, and would like
  assistance, please [get in touch](https://omnios.org/about/contact).

* OpenSSL 1.0.x and 1.1.1 are deprecated and reached end-of-support at the end
  of 2019 and in September 2023 respectively. OmniOS has transitioned to
  OpenSSL 3 and still ships older versions for backwards compatibility, but
  these are maintained solely on a best-efforts basis. If possible, recompile
  software to use OpenSSL 3.

* Python 2 is now end-of-life and will not receive any further updates. The
  `python-27` package is still available for backwards compatibility but is
  maintained only on a best-efforts basis.

* OpenSSH in OmniOS no longer provides support for GSSAPI key exchange.
  This was removed in release r151038.

### Package changes
