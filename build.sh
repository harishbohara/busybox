mkdir ~/initramfs && cd ~/initramfs && mkdir -p bin sbin etc proc sys usr/bin usr/sbin lib
cp -a ./_install/* ~/initramfs/
cp custom_init ~/initramfs/init