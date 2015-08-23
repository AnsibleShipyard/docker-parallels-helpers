Docker Paralels Helpers
-----------------------

Parallels is seemingly faster than virtualbox, making it a
suitable provider replacement for tools such as:

  1. virtualbox
  1. vagrant
  1. boot2docker
  1. docker-machine
  1. Your personal use

This particular repository focuses on docker, more specifically docker-machine
and boot2docker. It is recommended that you come prepared understanding how
to use docker-machine with virtualbox before using this provider. Many common
questions I field are users trying to use this provider first without knowing
docker-machine in general (and the default provider).

Note: boot2docker has been deprecated in favor or docker-machine

The tools here create additional commands with the `p` suffix. This is as to
not replace or get in the way of any default installs.

The new commands:
  - boot2dockerp
  - docker-machinep

## Example:

Once installed you can run commands such as:
```shell
docker-machinep start default

and

boot2dockerp up # if you like using boot2docker
```

## Issues
1. I can't run docker commands with boot2dockerp.
```shell
# You may want to make sure vbox instances are down
# It is possible (and I do this) to run both vbox and parallels,
# having multiple command shells open which connect to their
# respective docker daemonized virtual machine.
boot2docker halt # not the parallels version

# Get env vars
boot2dockerp env

# else if you didn't run up yet
boot2dockerp up

# copy and past the export commands from the `env` command above.
# re-run docker
docker ps
```

1. I can't run `docker-machinep create default`.
```shell
# docker-machine keeps track of machines and their driver
docker-machine ls # notice that this is not docker-machinep (parallels version)

# You will need to remove the existing default
docker-machine rm default

# Create the parallels version
docker-machinep create default

# Close, then reopen Parallels desktop, you will see the new default box
# docker ps should work after you run the common eval command:
eval "$(docker-machinep env default)"

# list machines
docker-machinep ls

# list containers
docker ps
```
