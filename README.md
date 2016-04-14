# AWS-Automation
Contains various scripts and scenarios for automating the aws tasks and operations

# Regional Layer Vs. Instance Layer
Regional Layer (Admin Level) - Account with AWS generates “accesskeyID” and “secretaccesskey (most critical)” associated with the Region and attaches to the account. In order to perform any AWS operations in the default region, these keys has to be predefined (Admin rights). Region & Accesskey ID Vs. Security Group & KeyPair (Public Private). Multiple Key pairs can be generated for different users or pass on the default one. Creation of private key/keys applies to all instances in the region. However, user access to instances is controlled by security groups (SSH). Also make sure to create IAM user (user level key) with full admin privileges to be used in place of “access key” for admin tasks in order to secure the access key. All the corresponding public keys are created vs. region in the cloud and the key pairs can be used for all the instances to be created.
Instance Layer (User Level) - Instance related tasks such as creating instances with parameters, creating AMI’s, attaching AMI’s to new instance, terminating instances, VPC etc. can be done at user level. This needs, sequentially, region info, private key and security group access.

AWS CLI Tools – Command Format is “aws ec2 <options>”
Aws configure <> – Command to configure global values such as region, access and security key, private key etc.
Aws ec2 create-security-group –group-name <> --description <> -creates this group ID in the region Vs. Accesskey.
Aws ec2 describe-instances – list all the instances in the predefined region
Aws ec2 create-key-pair –key-name <> --query ‘keyMaterial’ –output text <>.pem

