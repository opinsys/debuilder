prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin
sbindir = $(exec_prefix)/sbin
sysconfdir = $(prefix)/etc
localstatedir = $(prefix)/var
spooldir = $(localstatedir)/spool

INSTALL = install
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644

.PHONY : all
all :

bin/debuilder-paths : tools/generate-debuilder-paths.sh
	tools/generate-debuilder-paths.sh $@ $(spooldir)/debuilder $(sysconfdir)/debuilder/config

.PHONY : installdirs
installdirs :
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)/debuilder
	mkdir -p $(DESTDIR)$(spooldir)/debuilder

.PHONY : install
install : bin/debuilder-paths installdirs
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir)/ \
		bin/*
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir)/ \
		sbin/*
	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/debuilder \
		etc/debuilder/config
	rm bin/debuilder-paths

.PHONY : clean
clean :
