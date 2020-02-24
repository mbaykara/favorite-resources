### How to make file system?
There are two file system which is relatively important
1. xfs 
  * is default file system
  * fast and scalable
  * Uses CoW (Copy on Write) to guarantee the integrity
  * The size can be increased but not decreased
  * `mkfs.xfs [partition]` command to make file system
`# mkfs.xfs /dev/sda1`
### Managing XFS file systems
 * The **xfsdump** utility can be used for creating backups of XFS formatted devices
 * xfsdump can make full backup or different levels if incremental backup
 * `xfsdump -I 0 -f /backuofiles/data.xfsdump /data` create a full backup of the /data directory
 * **xfsrestore** command is used restore a backup that was made with **xfsdump**
  * `xfsrestore -f /backuofiles/data.xfsdump /data`
  * **xfsrepair** to repair broken xfs file systmes


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

### Managing Systemd Mounts
 * /etc/ftab mounts already are systemd mounts
 * Mounts can be created using systemd .mount files
 * Using .mount file allows you to be more specific in defining dependencies
 * Use systemctl cat tmp.mount
 ```bash
 root@# systemctl cat tmp.mount  //here is systemd tmp mount file,Just copy this file to create a custom
 mount
 // in this file there 2 part 
 [Unit] // not really important the sense of mount
 
 
 [Mount] // this is the important section of file
 What= // so what should be mounted
 Where= // to where
 Type= // what kind of file system
 Options= // some options such defauls
 ```
 To see active status of tmp.mount
 
 `# systemctl status tmp.mount` if it's not active hit `systemctl enable tmp.mount`
 
 Lets create do our custom mount
```bash
// custom .mount file name is not arbitrary it should be same as the directory to be mounted. For subdirectory use dash(-) i.e data-client.mount
# cp /usr/lib/systemd/system/tmp.out  /etc/systemd/system/directoryName.mount 
```
Then the file will looks as below
```bash
[Unit]
Description=articles
Documentation=man
Conflicts=umount.target
Before=local-fs.target umount

[Mount]
What=LABEL=customLabel
Where=/directoryName
Type=ext4
Options=defaults
```
Let's tell systemd to we've created a new configuration file

`# systemctl daemon-reload` 
if it's not mounted to the right directory then
```bash
# umount /directoryName
# systemctl enable --now directoryName.mount // it should be okay now
```
 
The consistent way to do mounting is using  systemd
