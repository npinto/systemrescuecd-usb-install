VERSION:=2.4.1

default: install

systemrescuecd-x86-${VERSION}.iso:
	wget http://downloads.sourceforge.net/project/systemrescuecd/sysresccd-x86/${VERSION}/$@

install:
	mkdir -p /tmp/systemrescuecd
	-mount -o loop,exec ./systemrescuecd-x86-${VERSION}.iso /tmp/systemrescuecd
	cd /tmp/systemrescuecd && bash ./usb_inst.sh
