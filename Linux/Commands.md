### 1. How to see cpu information and cores etc...?

``` bash
$ lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('  #show how many socket, threads,CPUs
$ nproc --all #see cpu cores
$ echo "Cores = $(( $(lscpu | awk '/^Socket\(s\)/{ print $2 }') * $(lscpu | awk '/^Core\(s\) per socket/{ print $4 }') ))" 
```

### Add executable to PATH

`PATH=/path/to/installed/directory:$PATH`

`PATH=/user/local/bin/cmake:$PATH`
