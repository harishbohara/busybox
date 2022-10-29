
# Make 
RMAFS_FOLDER=~/initramfs
(mkdir -p $RMAFS_FOLDER && cd $RMAFS_FOLDER && mkdir -p bin sbin etc proc sys usr/bin usr/sbin lib)
cp -a ./_install/* $RMAFS_FOLDER
cp custom_init $RMAFS_FOLDER/init
chmod +x $RMAFS_FOLDER/init

# Build a custom command
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o fetch_google main.go
chmod +x fetch_google && cp fetch_google $RMAFS_FOLDER

# Make initramfs
(cd $RMAFS_FOLDER && find . -print0 | cpio --null -ov --format=newc | gzip -9 > ~/initramfs.cpio.gz)