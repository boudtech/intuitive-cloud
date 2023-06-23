# Intuitive Cloud Lab performed by Alexey Budkevich on June 9th, 2023 at 3:50pm EDT,
### README.md file was corrected on June 23rd, 2023
##
## Lab Data issued:
### Terraform:
### 1. Review the AWS or Azure reference architecture (slides 4 & 5)
### 2. Develop the Terraform templates to create the reference architecture
### (AWS or Azure). Please be sure to make use of modules and all other
### best practices. For this exercise, assume the use of Terraform
### opensource.
### 3. Commit your Terraform to the feature branch
##
## Lab Results committed:
### 1. AWS reference architecture (slide 4) was reviewed and chosen to be performed
### 2. Terraform templates to create the reference architecture (AWS) developed.
### 'Please be sure to make use of modules and all other best practices':
### As the reference architecture is pretty simple than was decided to use the simple
### Terraform files plan (main.tf, provider.tf, variables.tf) 
### and NOT use different files for each Terraform module (VPC, Subnet, SecurityGroup, EC2_Instance, S3_bucket)
### to prevent files from missing during the archiving and copying or due to any other data corruption.
### 3. Terraform files + README.md (this file) were committed to the Main (single) branch
## https://github.com/boudtech/intuitive-cloud
### to prevent any other branch merge and pull-request occasional mixing.
##
## !!! IMPORTANT !!!
## Before running the 'terraform plan' or 'terraform apply' commands, please replace the following in the 'provider.tf' file:
### access_key = "my-access-key" <= your AWS account 'Access key ID'
### secret_key = "my-secret-key" <= your AWS account 'Secret access key'
##
## Thanks and Enjoy!
