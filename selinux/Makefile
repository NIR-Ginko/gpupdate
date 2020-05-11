MOD_GPSTORAGE=gpstorage
MOD_GPUPDATE=gpupdate
MOD_GPOA=gpoa

.PHONY: gpstorage gpoa gpupdate

# Compile Type Enforcement into Policy Package. Built using checkpolicy
# package on ALT Linux.
# First we expand M4 macros and then checkmodule will be able to
# compile the policy.
gpstorage:
	make -f /usr/share/selinux/devel/Makefile $(MOD_GPSTORAGE).pp
	checkmodule -M -m -o $(MOD_GPSTORAGE).mod $(MOD_GPSTORAGE).pp

gpoa:
	make -f /usr/share/selinux/devel/Makefile $(MOD_GPOA).pp
	checkmodule -M -m -o $(MOD_GPOA).mod $(MOD_GPOA).pp

gpupdate:
	make -f /usr/share/selinux/devel/Makefile $(MOD_GPUPDATE).pp
	checkmodule -M -m -o $(MOD_GPUPDATE).mod $(MOD_GPUPDATE).pp

all: gpstorage gpoa gpupdate

