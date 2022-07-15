# Terraform-Project
This project uses Terraform to create a virtual machine (ec2 instance) in AWS and deploys a web server when ran using bashscript.

### Steps taken to achieve this
- I created a new key pair in aws and moved it to my terraform folder. Created an iam user in AWS, copied my access key and secret key which was used to integrate Terraform with my AWS account.
- Created my Terraform files and resources
- Wrote a bash script in the "userdata.tlp" file I created which installs/deploys Nginx (a web server) on the ec2 instance created and echoes a "Hello Onyinye" message when the output url is loaded on a browser

![nginx deployed](https://user-images.githubusercontent.com/89241109/179250256-e8a0fb4a-f18f-4641-9ffe-807c59c0b3eb.png)
