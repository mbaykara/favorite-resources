#### chroot vs pivot_root

There are security advantages to using pivot_root over chroot, so in practice you should find the former if you 
look at the source code of a container runtime implementation. The main difference is that pivot_root takes advantage of the 
mount namespace; the old root is no longer mounted and is therefore no longer accessible within that mount namespace. 
The chroot system call doesn’t take this approach, leaving the old root accessible via mount points.

#### mount namespace
You may be familiar with the concept of mounting host directories into a container using docker run -v <host directory>:<container directory> ....
  To achieve this, after the root filesystem has been put in place for the container, the target container directory is created and then the source 
  host directory gets bind mounted into that target. Because each container has its own mount namespace, host directories mounted like this
  are not visible from other containers.
