%define _unpackaged_files_terminate_build 1
# Test for presence of native compiler
%global opt %(test -x %{_bindir}/ocamlopt && echo 1 || echo 0)

Name: gpupdate
Version: 2.0.0
Release: alt1

Summary: GPT applier
License: GPLv3+
Group: Other
Url: https://github.com/NIR-Ginko/gpupdate
BuildArch: noarch

# To build SELinux rules
BuildRequires: checkpolicy
# To build OCaml binaries
BuildRequires: rpm-build-ocaml
BuildRequires: ocaml-findlib-devel
BuildRequires: dune
BuildRequires: opam
BuildRequires: ocaml >= 4.0.0

Requires: ocaml >= 4.0.0
Requires: control
Requires: local-policy >= 0.3.0
#Requires: pam-config >= 1.8
#Requires: libnss-role >= 0.5.0
# This is needed by shortcuts_applier
#Requires: desktop-file-utils
#Requires: oddjob-%name >= 0.2.0

Source0: %name-%version.tar

%description
gpupdate is the facility to apply various GPO/GPT settings retrieved
from Active Directory domain in UNIX environment.

%prep
%setup -q

%build
make byte
%if %opt
make opt
%endif

%install

%preun
%preun_service gpupdate

%post
%post_service gpupdate

%files
%_sbindir/gpoa
%_bindir/gpupdate

%changelog
* Wed Apr 22 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.5.0-alt1
- Update samba format: local.xml -> Machine/Registry.pol.xml
- Add support of ad-domain-controller local policy profile
- Set properly URL of project

* Mon Apr 20 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.4.5-alt1
- Add support for control system-policy and requires to new pam-config

* Sun Apr 19 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.4.4-alt1
- Add gpupdate-setup initialization script supported local-policy profiles

* Fri Mar 06 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.4.3-alt1
- Fix polfile merging
- Add support controls with strings values
- Initial SIGINT signal handling

* Wed Feb 19 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.4.2-alt1
- Change service type to 'simple' because gpoa is not systemd-aware
- Shortcuts fixes and improvements

* Wed Feb 12 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.4.1-alt1
- Update license to GPLv3+
- Run gpudate as root without user argument for Computer target only
- Fix chromium applier

* Thu Jan 30 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.4.0-alt1
- Update release with first pack of stabilization fixes

* Thu Jan 16 2020 Evgeny Sinelnikov <sin@altlinux.org> 0.3.0-alt1
- Add user appliers support and machine gsettings apllier
- Add require to oddjob-gpupdate

* Fri Dec 20 2019 Evgeny Sinelnikov <sin@altlinux.org> 0.2.1-alt2
- Add support system-policy for PAM settings

* Thu Dec 19 2019 Evgeny Sinelnikov <sin@altlinux.org> 0.2.1-alt1
- Next part of refactoring
- Add simple support adp

* Fri Dec 06 2019 Igor Chudov <nir@altlinux.org> 0.2.0-alt1
- Code refactored to work with storage facility
- Retrieval of HKCU preferences implemented
- Numerous backend and frontend stability improvements
- Chromium and Firefox appliers implemented

* Thu Nov 28 2019 Evgeny Sinelnikov <sin@altlinux.org> 0.1.0-alt1
- Change license to GPLv2+
- Refactor and separate code to backend and frontend

* Sun Nov 17 2019 Evgeny Sinelnikov <sin@altlinux.org> 0.0.3-alt1
- Clean code, fix functionality (Initialize cache if missing, retrieve SIDs)
- Run GPO applier as /usr/sbin/gpoa

* Fri Nov 15 2019 Igor Chudov <nir@altlinux.org> 0.0.2-alt1
- Removed hreg dependency
- Introduced caches for SIDs and Registry.pol file paths
- gpupdate transformed into simple gpoa starter
- gpoa learned to work with username
- Introduced TDB manager in order to work with samba-regedit registry
- DC domain detection now uses native python-samba functions to query LDAP

* Thu Nov 14 2019 Igor Chudov <nir@altlinux.org> 0.0.1-alt1
- Initial release

