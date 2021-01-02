## 3e Explain when to use and not use provisioners and when to use local-exec or remote-exec

## Summary 

Provisioners are used to execute scripts on a local or remote machine as part of resource creation or destruction. Provisioners can be used to bootstrap a resource, cleanup before destroy, run configuration management, etc.

Please look below the points in regards to the provisioners from remote to local.

* Provisioners are a Last Resort
* Passing data into virtual machines and other compute resources
* Running configuration management software
* local-exec provisioner requires no other configuration

| Index |
|:----------:|
|[Provisioners](https://www.terraform.io/docs/provisioners/#provisioners-are-a-last-resort)|
