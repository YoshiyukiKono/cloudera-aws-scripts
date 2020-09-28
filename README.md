# Cloudera AWS Scripts

This repository can be used to create an EC2 instance where you will setup a Cloudera cluster using the scripts maintained in the repository, [SingleNodeCDHCluster](https://github.com/YoshiyukiKono/SingleNodeCDHCluster) (Please refer to the script and json files for more details).

## Specification

The following specs are hard-coded.
- Instance Type: t2.2xlarge
- OS: CentOS 7 (x86_64) - with Updates HVM
- OS User: centos
- Device Volume Size: 50G

- Region: us-east-2

### AMI ID
You can find AMI ID of CentOS7 for your reagion from [link to AWS Marketplace](https://aws.amazon.com/marketplace/pp/B00O7WM7QW)
- Click the `Continue To Subscrive` button
- Click the `Continue To Configure` button
- Chose your region from `Region` list.

Sample:
- Asia Pacific (Tokyo): ami-06a46da680048c8ae
- US East (Ohio): ami-01e36b7901e884a10

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
