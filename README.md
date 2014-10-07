splunk-rsync
============

Simple bash shell script that allows easy rsync-ing of two Splunk servers (search head instances).
In order to use it you must have an IP alias (i.e. eth0:0). The script uses the alias to determine if 
the current node is active or not (only node one should have the IP alias).

If it is active, the scrypt rsync's whole $SPLUNK_HOME directory to the other node.
