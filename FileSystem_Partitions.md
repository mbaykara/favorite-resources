### How to create file system?
There are two file system which is relatively important
1. xfs 
  * is default file system
  * fast and scalable
  * Uses CoW (Copy on Write) to guarantee the integrity
  * The size can be increased but not decreased
  * `mkfs.xfs [partition]`
  
`# mkfs.xfs /dev/sda1`

* ext4

`# mkfs.ext4 /dev/sda1`
