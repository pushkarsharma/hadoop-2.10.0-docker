# hadoop-2.10.0-docker

Ubuntu-xenial base with hadoop-2.10.0, ssh, jdk8, ping, vim packages.

<h2>Configuration</h2>

1. Update the `core-site.xml` & `yarn-site.xml` configuration files with the IP of the Master node.
2. Update the slaves file configuration with the IP of the slave.
3. Generate the ssh keys for master and worker nodes.
4. Copy the keys of master and workers in ~/.ssh/authorized_keys for all of machines <strong>(All keys in all systems)</strong>
