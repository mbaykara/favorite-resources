#### chroot vs pivot_root
There are security advantages to using pivot_root over chroot, so in practice you should find the former if you 
look at the source code of a container runtime implementation. The main difference is that pivot_root takes advantage of the 
mount namespace; the old root is no longer mounted and is therefore no longer accessible within that mount namespace. 
The chroot system call doesn’t take this approach, leaving the old root accessible via mount points.
