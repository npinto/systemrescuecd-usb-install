VERSION:=2.4.1
ISO=systemrescuecd-x86-${VERSION}.iso
TMP=/tmp/${ISO}_mnt

default: install

${ISO}:
	wget http://downloads.sourceforge.net/project/systemrescuecd/sysresccd-x86/${VERSION}/$@

install:
	mkdir -p ${TMP}
	-mount -o loop,exec ${ISO} ${TMP}
	cd ${TMP} && bash ./usb_inst.sh

clean:
	-umount ${TMP}
	rm -vf ${ISO}
