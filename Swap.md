* Swap is RAM that is emulated on disk
* Kernel handled swap in a smart way by analyzing free RAM
* Swap can be created on any block device, including swap files
* File system type should be **linux-swap**
* To create swap **parted**, set file system to **linux-swap**
* After creating the swap partition, use **mkswap** to create swap FS
* To activate swap partition, use **swapon**
```bash
# parted /dev/sda1


(parted) mkpart
name ? swap
file type linux-swao
start 1GiB
end 2GiB
```
quit from parted. Lets create it

`mkswap /dev/sda1` then activating

`swapon /dev/sda1`

To make swap persistent you have to create either systemd .mount or /etc/fstab

```bash
  # vim /etc/fstab
  add following line 
  /dev/sda1        swap(kernel space)       swap      defaults  0 0
```
