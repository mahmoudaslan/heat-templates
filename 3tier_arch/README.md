# 3 Tier web architecture
This folder contains OpenStack heat templates to create a 3-tier web architecture with scalability on the web servers and application servers layers, but not the database.
The database is left for you to create since scalling a DB server needs a lot more create new VMs. The two loadbalancers associated with web servers and application servers needs to be created first. Inputs to the templates are specified in env.yaml file.