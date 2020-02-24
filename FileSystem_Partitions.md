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


