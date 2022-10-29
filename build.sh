(mkdir -p ~/initramfs && cd ~/initramfs && mkdir -p bin sbin etc proc sys usr/bin usr/sbin lib)
chmod +x custom_init
cp -a ./_install/* ~/initramfs/
cp custom_init ~/initramfs/init