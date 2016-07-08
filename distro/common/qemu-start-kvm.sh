#!/usr/bin/expect -f
spawn qemu-system-aarch64 -machine virt -cpu host -kernel Image_D02 -drive if=none,file=ubuntu.img,id=fs -device virtio-blk-device,drive=fs -append "console=ttyAMA0 root=/dev/vda1" -nographic -D -d -enable-kvm
set timeout 40
expect "estuary:/$"
send "mount -t ext4 -o remount,rw /dev/vda1 /"
set timeout 5
send "\n"
send \x01
send "c"
send "\n"
send "quit"
send "\n"
expect eof
interact
exit 0
