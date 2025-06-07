# BENJI AWS Terraform Project

This project provisions an AWS VPC, RDS MySQL database, security groups, and Route 53 DNS records using Terraform.

## Features

- Creates a VPC with public, private, and database subnets
- Deploys a MySQL RDS instance
- Configures security groups for RDS access
- Sets up Route 53 DNS records for the database endpoint

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) v1.6 or newer
- [AWS CLI](https://aws.amazon.com/cli/) configured with appropriate credentials
- [Git](https://git-scm.com/)

## Usage

1. **Clone the repository:**
   ```sh
   git clone https://github.com/benjamincode-24/BENJI.git
   cd BENJI/13-DNS-to-DB
   ```

2. **Configure your secrets:**
   - Create a `secrets.tfvars` file (not tracked by git) with your sensitive variables:
     ```hcl
     db_username = "your_db_username"
     db_password = "your_db_password"
     ```
   - Ensure `secrets.tfvars` is listed in `.gitignore`.

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Plan and apply:**
   ```sh
   terraform plan -var-file="secrets.tfvars"
   terraform apply -var-file="secrets.tfvars"
   ```

## Protecting Secrets

- Sensitive files like `secrets.tfvars` and Terraform state files are excluded via `.gitignore`.
- **Never commit secrets or credentials to the repository.**

## Customization

Edit the `rdsdb.auto.tfvars` and other `.tfvars` files to customize your database name, instance identifier, and other settings.

## Project Structure

```
BENJI/
└── 13-DNS-to-DB/
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── c4-01-vpc-variables.tf
    ├── c5-06-securitygroup-rdsdbsg.tf
    ├── c13-02-rdsdb.tf
    ├── rdsdb.auto.tfvars
    ├── secrets.tfvars (not committed)
    └── .gitignore
```

## License

MIT License

Copyright (c) 2025 benjamincode-24

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.