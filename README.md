### How to build and run
Added a full script to do the build. Run ```build.sh```. It will do the following

1. Create required initramfs folder with all dir
2. Have a custom init (custom_init) which will be used as init program
3. Have a go program "fetch_google" which will be copied in final file system
4. Make the ```initramfs.cpio.gz``` in home dir

### How to run
Use QEMU to run this. It will setup the network (defined in ```custom_init``` or ```init``` file). 
```sh
sudo qemu-system-x86_64   -kernel vmlinux -initrd ~/initramfs.cpio.gz -hda /dev/zero -append "root=/dev/zero console=ttyS0" -serial stdio -display none  -netdev user,id=vmnic -device e1000,netdev=vmnic
```

You can run ```fork fetch_google``` to run the custom go command