# Static Website Hosting on AWS with Terraform

This project demonstrates how to host a static website on AWS using Terraform Infrastructure as Code (IaC). The solution uses Amazon S3 to serve static HTML files with public access configuration.

## Project Overview

The project creates a complete static web hosting solution with:
- S3 bucket configured for static website hosting
- Public access policy for website content
- Automatic file upload for HTML pages
- Website endpoint generation for public access

## Project Structure

```
proj1-static-web-host/
├── providers.tf          # Terraform and AWS provider configurations
├── s3.tf                # S3 bucket and website configuration
├── output.tf            # Output values for website endpoint
├── build/               # Static website files
│   ├── index.html       # Main page
│   └── error.html       # Error page
├── .terraform.lock.hcl  # Terraform dependency lock file
└── README.md            # This file
```

## AWS Permissions Required

Your AWS credentials need the following permissions:
- `s3:CreateBucket`
- `s3:DeleteBucket`
- `s3:PutObject`
- `s3:DeleteObject`
- `s3:PutBucketPolicy`
- `s3:PutBucketWebsite`
- `s3:PutBucketPublicAccessBlock`

## How to Deploy

### Step 1: Clone and Navigate
- Clone this repository to your local machine
- Navigate to the project directory

### Step 2: Configure AWS Credentials
- Set up AWS credentials using AWS CLI or environment variables
- Ensure your credentials have the required S3 permissions

### Step 3: Initialize Terraform
- Initialize the Terraform working directory
- This downloads the required providers (AWS and Random)

### Step 4: Plan the Deployment
- Review the planned infrastructure changes
- Verify all resources that will be created

### Step 5: Apply the Configuration
- Deploy the infrastructure to AWS
- Confirm the deployment when prompted

### Step 6: Access Your Website
- Use the output endpoint URL to access your static website
- The website will be available at the S3 website endpoint

## Outputs

The project provides the following output:
- `static_website_endpoint`: The URL where your website is accessible

## Clean Up

To destroy the infrastructure and avoid ongoing charges:
- Run Terraform destroy command
- Confirm the destruction when prompted
- This will remove all created AWS resources
##########################################################################################################################################
##########################################################################################################################################
