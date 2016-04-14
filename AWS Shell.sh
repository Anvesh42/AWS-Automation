#AWS Automation with Bash
#!/bin/sh									
										
####Launch AWS Instance####

instance_id = $ (aws ec2 run-instances --image-id <ami> --instance-type <type> --count <#> --output text --query 'Instances[*].InstanceID')	
| echo "instance with instance ID $instance_id has been launched" || errexit "could not run instance"

while instance_state = $(aws ec2 describe-instances --instance-ids $instance_id --output text --query 'Reservations[*].Instances[*].State.Name');
test "$instance_state" = "pending"; do
echo "Please wait"; sleep 1; done
echo "Instance is $instance_state"

####Tag the Launched Instance####

aws ec2 create_tags --tags key=environment,value=dev1 --resources "$instance_id"	|| errexit "error tagging"



####IAM Tasks#####

for user in $(aws iam list-users --query 'Users[].[UserName]' --output text); do
aws iam delete-user --user-name "$user";
done

							
