Validate

packer validate  -var-file=credentials.pkr.hcl containers-server/containers-server.pkr.hcl



Build

packer build  -var-file=credentials.pkr.hcl containers-server/containers-server.pkr.hcl


For cloud init to work the http/ folder needs to have both user-data and meta-data files otherwise it wont work