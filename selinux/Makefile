MOD_GPSTORAGE=gpstorage
MOD_GPUPDATE=gpupdate
MOD_GPOA=gpoa

# -C - compile to CIL (for debug purposes)
CHECKMODULE_OPTS=-M -m

.PHONY: gpstorage gpoa gpupdate

# Compile Type Enforcement into Policy Package. Built using checkpolicy
# package on ALT Linux.
# First we expand M4 macros and then checkmodule will be able to
# compile the policy.
gpstorage:
	make -f /usr/share/selinux/devel/Makefile $(MOD_GPSTORAGE).pp
	checkmodule $(CHECKMODULE_OPTS) -o $(MOD_GPSTORAGE).mod tmp/$(MOD_GPSTORAGE).tmp
	semodule_package -o $(MOD_GPSTORAGE).pp -m $(MOD_GPSTORAGE).mod

gpoa:
	make -f /usr/share/selinux/devel/Makefile $(MOD_GPOA).pp
	checkmodule $(CHECKMODULE_OPTS) -o $(MOD_GPOA).mod tmp/$(MOD_GPOA).tmp
	semodule_package -o $(MOD_GPOA).pp -m $(MOD_GPOA).mod

gpupdate:
	make -f /usr/share/selinux/devel/Makefile $(MOD_GPUPDATE).pp
	checkmodule $(CHECKMODULE_OPTS) -o $(MOD_GPUPDATE).mod tmp/$(MOD_GPUPDATE).tmp
	semodule_package -o $(MOD_GPUPDATE).pp -m $(MOD_GPUPDATE).mod

all: gpstorage gpoa gpupdate

