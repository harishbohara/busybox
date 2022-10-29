(mkdir -p ~/initramfs && cd ~/initramfs && mkdir -p bin sbin etc proc sys usr/bin usr/sbin lib)
cp -a ./_install/* ~/initramfs/
cp custom_init ~/initramfs/init
chmod +x ~/initramfs/init
(cd ~/initramfs && find . -print0 | cpio --null -ov --format=newc | gzip -9 > ~/initramfs.cpio.gz)