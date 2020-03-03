### SELinux
* Complete and mandatory security solution for Linux alike system. 
* **Principle :** If is not specifically allowed, it will be denied. 
#### There are two state of SELinux
* enabled  <= KERNEL => disabled
* Always to switch from state you have to reboot the system
* Sure there are also troubleshooting mode as well
 
 -> Enforcing --> fully operational, block everything
 
 -> Permissive --> it will log but not block
 
 Two switch between mood
 * **setenforce** toggles between Enforcing and Permissive
 * **getenforce**  will shot the current state
 ** Edit `/etc/sysconfig/selinux` to manage default state of SELinux

```bash
##Acutally you have perform the actions as root
#To change it from enable to disable
$ getenforce # to see current state
$ setenforce permissive  # setting SELinux to permissive mood
$ getenforce # will see the state is now **Permissive** but not disabled
#To disable SELinux we have edit config file as below. Change to disabled
$ vim /etc/sysconfig/selinux
SELINUX=disabled
$ reboot
# After reboot machine state should be disabled. If you want to back to enable mood then
$ vim /etc/sysconfig/selinux
SELINUX=enabled
$ reboot ## State changing will take times about 2 or 3 mins
 ```
 
### Labels and Booleans
* Every object is labeled with a context label
* user : user specific context
* role : role "         "
* type : flags which type of operation is allowed on this object
* **Z** is argument to see SELinux information
`ps -auxZ` to see running process and SELinux information
```bash
$ ps -auxZ | grep ssh

system_u:system_r:sshd_t:s0-s0:c0.c1023

Crucial part is sshd_t context-type which discribe what the process allow to do
# To change boolean context
$ getsebool -a | grep http
$ setsebool -P http_enable_homedirs on // will make avaiblable to save in home
```

