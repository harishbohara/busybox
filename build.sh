(mkdir -p ~/initramfs && cd ~/initramfs && mkdir -p bin sbin etc proc sys usr/bin usr/sbin lib)
(cd ~/initramfs && chmod +x custom_init)
cp -a ./_install/* ~/initramfs/
cp custom_init ~/initramfs/init