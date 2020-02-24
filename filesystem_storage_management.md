### How to make file system?
There are two file system which is relatively important
1. xfs 
  * is default file system
  * fast and scalable
  * Uses CoW (Copy on Write) to guarantee the integrity
  * The size can be increased but not decreased
  * `mkfs.xfs [partition]` command to make file system
  
`# mkfs.xfs /dev/sda1`

2. ext4
  * Backward compatibility ext2
  * Use `Journal` to keep integrity safe
  * Flexible increase or decrease
  * `mkfs.ext4 [partition]` command to make file system
  
`# mkfs.ext4 /dev/sda1`

### How to create partitons
There are also at least two approach to perform this task such as
1. `parted` is default in RHEL 8 

```bash 
 # parted /dev/sda1
 # print 
 # mklabel msdos | gpt
 # mkpart part-type name fs-type start end
 # print
 # quit
 
```
2. Using `fdisk`
```bash
# fdisk /dev/sda1
then processing partition process 
```
### How to mount created partition?

* `mount [partition] [DestinationToBeMounted]`
* `mount /dev/sda1 /mnt`
* `umount [partion | Destination]`

### How to automate mounting process ?
Essensial configuration is in `/etc/fstab`
```bash
# vim /etc/fstab
-## add partition, destination, filesystem
-/dev/sda1         /xfs          xfs       defaults   0 0
-
# systemctl daemon-reload 
# mount -a
```

### Troubleshooting 
* mount: /xfs: wrong fs type, bad option, bad superblock on /dev/sda1, missing codepage or helper program, or other error.

*  dmesg | grep [partition]
Set the file system again or check to the logs

###T2
* `A start job is running for dev-xxx.device`
* Wait then will start emergency mood then enter root pass

edit /etc/fstab file, comment out mouted partitions to keep persistency
