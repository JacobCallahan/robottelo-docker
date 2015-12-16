# robottelo-docker
Robottelo in a Container

Installation
------------
```docker pull jacobcallahan/robottelo-docker```

Usage
-----
```docker run <arguments> <volumes> -it jacobcallahan/robottelo-docker:latest```

Accepted Arguments
------------------
-e  (e.g. ```-e "TESTS=tests/foreman/smoke/test_api_smoke.py"```)
 * SERVER_URL - Target satellite hostname.
 * TESTS - The path to a specific test or test module.
 * MAKE - A specific robottelo make target
 * UPSTREAM - true/false
 * SSH_KEY - The path to your ssh key (must be passed in as a volume).

Volumes
-------
We support mounted volumes for your ssh key and your robottelo.properties file.
Due to Git limitations, you cannot directly mount these files into the
root/robottelo directory. Instead, mount them to the root directory.
Ensure that you provide the ssh key path in the arguments
(i.e. ```-e "SSH_KEY=/root/my_ssh_key"```).
