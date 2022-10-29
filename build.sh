(mkdir -p ~/initramfs && cd ~/initramfs && mkdir -p bin sbin etc proc sys usr/bin usr/sbin lib)
cp -a ./_install/* ~/initramfs/
cp custom_init ~/initramfs/init
chmod +x ~/initramfs/init

CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o fetch_google main.go
chmod +x fetch_google && cp call ~/initramfs
(cd ~/initramfs && find . -print0 | cpio --null -ov --format=newc | gzip -9 > ~/initramfs.cpio.gz)