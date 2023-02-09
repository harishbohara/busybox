### How to build and run
Added a full script to do the build. Run ```build.sh```. It will do the following. Note I have already checked-in pre-built ```_install``` 
for X86 on linux. 

1. Create required initramfs folder with all dir
2. Have a custom init (custom_init) which will be used as init program
3. Have a go program "fetch_google" which will be copied in final file system
4. Make the ```initramfs.cpio.gz``` in home dir

###### IMP - Above steps will do create the complete build of initramfs.cpio.gz (this will build as ~/initramfs.cpio.gz file). This is ready to run the kernel with QEMU. Now if you have a vmlinux you can use the folloowing steps to run (and debug kernel if required)

### How to run
Use QEMU to run this. It will setup the network (defined in ```custom_init``` or ```init``` file). 
```sh
sudo qemu-system-x86_64   -kernel vmlinux -initrd ~/initramfs.cpio.gz -hda /dev/zero -append "root=/dev/zero console=ttyS0" -serial stdio -display none  -netdev user,id=vmnic -device e1000,netdev=vmnic
```

You can run ```fork fetch_google``` to run the custom go command

### Pre-built
I have already checked-in pre-built binaries. You can just use it ```_install```. It is built on ubuntu for Linux (x86)

### Full build
```shell
make defconfig
make menuconfig

# Make static binary
Busybox Settings ---> Build Options ---> Build BusyBox as a static binary (no shared libs) ---> yes

# Compile and install (dont worrk in make you may see some error. Just try make install)
make -j8 && make install
```
