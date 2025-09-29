# Launch Your First AWS EC2 Instance with Terraform (Minimal Code)

This guide shows how to create an **EC2 instance** on AWS using **very minimal Terraform code** and **temporary AWS credentials**, along with steps to create a **demo IAM user** with Administrator permissions.  
No extra variables, no profiles—just the basics.

---

## Prerequisites
- **AWS Account**  
- **Terraform Installed** (Download from [terraform.io](https://developer.hashicorp.com/terraform/downloads))  
- **Temporary AWS Credentials or IAM user with access keys**  

> ⚠️ For demo purposes only: the IAM user created will have Administrator access. **Do not use admin users in production.**

---

## 1️⃣ Create an IAM User with Admin Access (Demo Only)

### 1. Sign in to AWS Console
- Use your root or admin IAM user credentials.

### 2. Open IAM Service
- Search for **IAM** in the console and open it.

### 3. Create New User
1. Go to **Users → Add users**.  
2. Username: `demo-admin` (or any name).  
3. Select **Programmatic access** (for CLI/Terraform).  

### 4. Attach Administrator Permissions
- On **Permissions** step, choose **Attach existing policies directly**.  
- Select **AdministratorAccess**.  
- Click **Next** → **Create user**.

### 5. Save Access Keys
- Copy **Access Key ID** and **Secret Access Key** (or download .csv).

### 6. Configure AWS CLI
```bash
aws configure
```
Enter the keys when prompted:
```
AWS Access Key ID: <paste access key ID>
AWS Secret Access Key: <paste secret key>
Default region name: us-east-1
Default output format: json
```

### 7. Verify Configuration
```bash
aws sts get-caller-identity
```
- Confirms the CLI is configured with the IAM user.

> 💡 **Tip:** For real projects, use IAM roles & least privilege policies.

---

## 2️⃣ Set Up Your Terraform Project

```bash
mkdir minimal-ec2
cd minimal-ec2
```

- Creates a folder and moves into it.

### Create `main.tf`

```hcl
provider "aws" {
  region = "us-east-1"  # Default AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 AMI (update per region)
  instance_type = "t2.micro"              # Free-tier instance type
}
```

**Explanation:**
- `provider`: tells Terraform to use AWS and which region.
- `aws_instance`: creates a single EC2 instance with specified AMI and type.

### Optional Output (to see public IP)
Add this to `main.tf`:
```hcl
output "public_ip" {
  value = aws_instance.example.public_ip
}
```

---

## 3️⃣ Terraform Workflow (Commands & Steps)

### Initialize Terraform
```bash
terraform init
```
- Downloads AWS provider plugin.

### Format files (optional)
```bash
terraform fmt
```
- Formats HCL files.

### Validate configuration
```bash
terraform validate
```
- Checks syntax and consistency.

### Preview the plan
```bash
terraform plan -out=tfplan
```
- Shows what Terraform will create. Saved plan for later apply.

### Apply the plan
```bash
terraform apply "tfplan"
```
- Creates the EC2 instance. Type **yes** if prompted.

### Check Instance Public IP
```bash
terraform output public_ip
```
- Prints the public IP for the instance.

### Destroy Resources
```bash
terraform destroy -auto-approve
```
- Deletes the EC2 instance to avoid charges.

---

## 4️⃣ Notes & Tips
- AMI IDs are region-specific; update if using a different region.  
- `t2.micro` is free-tier eligible.  
- Temporary credentials expire; re-export if necessary.  
- For real projects, use IAM roles instead of admin users.

---

## Folder Structure

```
minimal-ec2/
│
└── main.tf      # Terraform configuration
```

✅ **Done!**  
You now have a minimal Terraform project to launch an EC2 instance and a demo IAM user with admin access for testing purposes.
