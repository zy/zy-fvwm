.SUFFIXES: .m4 .fvwm

HOST=$(shell hostname)

ifeq ($(HOST),)
$(error "The hostname for this system is not set!")
endif

PAGES=base.fvwm
HOST_PAGES=$(PAGES:%=$(HOST)/%)
$(HOST)/%.fvwm: %.m4
	m4 -P $< > $@

all: $(HOST)/$(HOST).m4 .fvwm2rc $(HOST_PAGES)

$(HOST)/$(HOST).m4:
	@if [ -r .fvwmrc ]; then \
		echo "There is a .fvwmrc file here already - you should back it up and rename or remove it" ;\
		exit 1 ;\
	fi
	@echo "Creating $(HOST)/$(HOST).m4 from sample.m4 - you might want to customise it"
	@mkdir -p $(HOST)
	cp sample.m4 $(HOST)/$(HOST).m4

.fvwm2rc:
	cp fvwm2rc.default .fvwm2rc

$(HOST)/base.fvwm: apps.m4 buttons.m4 funcs.m4 include.m4 keys.m4 modules.m4 mouse.m4 styles.m4 taskbar.m4 $(HOST)/$(HOST).m4 globals.m4 fonts-colours.m4 menus.m4 fvwm-gnome2 get_mini
#$(HOST)/menus.fvwm: apps.m4 include.m4 $(HOST)/$(HOST).m4 globals.m4

SOURCE=base.m4 apps.m4 menus.m4 buttons.m4 funcs.m4 include.m4 keys.m4 \
	modules.m4 mouse.m4 styles.m4 taskbar.m4 sample.m4 globals.m4 fonts-colours.m4 \
	Makefile README savedecor \
	decor fvwm2rc.default fvwm-gnome2 get_mini CHANGES AUTHOR COPYING

GRAPHICS=images icons

VERSION=0.4
DIR=fvwm-bh-$(VERSION)
tar:
	rm -rf $(DIR)
	mkdir $(DIR)
	cp -rp $(SOURCE) $(DIR)
	tar czf $(DIR).tgz $(DIR)
	tar czf fvwm-bh-graphics-$(VERSION).tgz $(GRAPHICS)

clean:
	rm -f *~
	rm -f .fvwm2rc $(HOST_PAGES)
	rm -rf $(DIR)
