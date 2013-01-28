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

config : tools/generate-config.sh
	tools/generate-config.sh $@ $(spooldir)/debuilder

.PHONY : installdirs
installdirs :
	mkdir -p $(DESTDIR)$(bindir)
	mkdir -p $(DESTDIR)$(sbindir)
	mkdir -p $(DESTDIR)$(sysconfdir)/debuilder
	mkdir -p $(DESTDIR)$(spooldir)/debuilder

.PHONY : install
install : config installdirs
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(bindir)/ \
		bin/debuilder-copy-pkg \
		bin/debuilder-pull-dsc
	$(INSTALL_PROGRAM) -t $(DESTDIR)$(sbindir)/ \
		sbin/debuilder \
		sbin/debuilder-add-rebuildd-job \
		sbin/debuilder-configure
	$(INSTALL_DATA) -t $(DESTDIR)$(sysconfdir)/debuilder \
		config

.PHONY : clean
clean :
	rm -f config
