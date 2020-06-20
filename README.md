# hadoop-2.10.0-docker

Ubuntu-xenial base with hadoop-2.10.0, ssh, jdk8, ping, vim packages.

<h2>Configuration</h2>

These are sloppy commands. Check the DevOps folder in Onedrive for video guidance.

1. Update the `core-site.xml` & `yarn-site.xml` configuration files with the IP of the Master node.
2. Update the slaves file configuration with the IP of the slave.
3. Create Namenode (only in master) and Datanode directory.
4. `chmod 755 /FakePath/Datanode`
5. `hdfs namenode -format` and look for succesful format.
5. Generate the ssh keys for master and worker nodes.
6. Copy the keys of master and workers in ~/.ssh/authorized_keys for all of machines <strong>(All keys in all systems)</strong>
