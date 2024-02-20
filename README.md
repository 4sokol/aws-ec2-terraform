# aws-ec2-terraform
AWS EC2 Instances creation by using Terraform. Terraform files deploy:

- Kubernetes Control Plane (Ubuntu Server 20.04 't2.medium'); 

- 2 worker nodes (Ubuntu Server 20.04 't2.large')


**Prerequisits**:

You need to generate an SSH keypair for the SSH connection to 3 EC2 nodes:

1. Open your terminal.
2. Run the following command to generate the SSH keypair:

```
ssh-keygen -t rsa -b 2048 -f ec2-kubernetes
```
3. This command will generate an RSA keypair with 2048-bit length and save the keys with the filename 'ec2-kubernetes'.

4. Press Enter when prompted to specify the file location and passphrase. If you don't want to set a passphrase, you can press Enter again.

5. After running the command, you will have two files in your current directory: ec2-kubernetes (private key) and ec2-kubernetes.pub (public key).

6. Now, you can use this SSH keypair to connect to your EC2 instances. You'll need to provide the public key (ec2-kubernetes.pub) to your EC2 instances during their creation (file 'terraform.tf).

**output.tf**
We use the .* syntax to reference all instances created by the aws_instance.medium_instance resource. This will return a list of values for each attribute (public_ip, private_ip, private_dns) for all instances created by the resource.

For the aws_instance.large_instance resource, we use indexing ([0] and [1]) to specify each individual instance within the resource.
