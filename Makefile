prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
libexecdir = $(exec_prefix)/lib
sysconfdir = $(prefix)/etc

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

.PHONY : all
all :

.PHONY : bin/debuilder-installdirs
bin/debuilder-installdirs :
	mkdir -p bin
	echo '#!/bin/sh' > $@
	echo "DEBUILDER_CONFDIR=$(sysconfdir)/debuilder" >> $@
	echo "DEBUILDER_LIBDIR=$(libexecdir)/debuilder" >> $@

.PHONY : installdirs
installdirs :
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)/debuilder
	mkdir -p $(DESTDIR)$(libexecdir)/debuilder

.PHONY : install
install : bin/debuilder-installdirs installdirs
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir)/ \
		bin/*
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir)/ \
		sbin/*
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(libexecdir)/debuilder \
		libexec/*
	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/debuilder \
		etc/debuilder/config
	rm bin/debuilder-installdirs

.PHONY : clean
clean :
