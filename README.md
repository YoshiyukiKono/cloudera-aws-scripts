# Cloudera AWS Scripts

## Specification

This project is designed for [SingleNodeCDHCluster](https://github.com/YoshiyukiKono/SingleNodeCDHCluster) (Please refer to the script and json files for more details).

The following specs are hard-coded.
- Region: us-east-2
- Instance Type: t2.2xlarge
- OS: CentOS 7
- OS User: centos
- Device Volume Size: 50G

## Prerequisite
You have an local environment where you can run AWS CLI as well as the AWS environment where you will create your Cloudera cluster.

## Preparation

Please replace `%YOUR_...%` in `instance_cloudera.json` with the values for your AWS environment.

```
    "KeyName": "%YOUE_KEY_NAME%",
    "SecurityGroupIds": [
         "%YOUR_SECURITY_GROUP_ID%"
    ],
...
    "SubnetId": "%YOUR_SUBNET_ID%",
```

Please replace `%YOUR_...%` in `cluster_cloudera.sh` with the values for your AWS environment.

```
KEY_NAME=~/%YOUR_KEY_NAME%
```

Please also replace `%..._AS_YOU_LIKE%` in `cluster_cloudera.sh` with any appropriate values.

```
TAG_PROJECT=%PROJECT_AS_YOU_LIKE%
TAG_OWNER=%OWNER_AS_YOU_LIKE%
INSTANCE_NAME=%INSTANCE_NAME_AS_YOU_LIKE%
```

## Run

Execute `cluster_cloudera.sh` on your local environment.
```
$ cluster_cloudera.sh 
```

Upon successful completion of the above script, you would find a new instance is created on AWS Web Console.

## Misc

When you execute the above script, you would find `passwordless_<INSTANCE_NAME_AS_YOU_LIKE>_<DATA_TIME>.sh` is generated locally.
You can use this script to enable passwordless (no need to use PEM file) login. You don't have to mind it necessarily for an instance.
This is a "sugar coating" function for when dealing with multiple instances in a script.
