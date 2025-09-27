# Demo: Create IAM User with Administrator Access, Configure AWS CLI, and Test EC2 Access

This guide demonstrates how to create an **IAM user** with **AdministratorAccess**, configure the **AWS CLI** locally, and test access by listing EC2 instances.

---

## 1️⃣ Prerequisites

- An **AWS account** with admin privileges.
- A local machine with **VS Code** or terminal access.
- **AWS CLI** installed.
- Basic familiarity with AWS Management Console.

---

## 2️⃣ Step 1: Create an IAM User

1. Go to the [AWS Management Console → IAM → Users → Add users](https://console.aws.amazon.com/iam/home#/users$new).

2. **User details**:
   - Username: `vs-code-user` (or any name).
   - Select **Access type**:  
     - ✅ **Programmatic access** (for CLI/SDK)
     - Optional: **AWS Management Console access** (for browser login).

3. Click **Next: Permissions** (or look for **Set permissions** section).

---

## 3️⃣ Step 2: Attach AdministratorAccess Policy

1. **Attach policies directly**.
2. Search for **AdministratorAccess**.
3. Check the box to attach.
4. Click **Next: Tags** → (Optional) Add tags.
5. Click **Next: Review** → Review username and permissions.
6. Click **Create user**.
7. **Download CSV** containing:
   - `Access key ID`
   - `Secret access key`  

> ⚠️ AdministratorAccess gives full permissions. Only use for demo. In production, follow **least privilege principle**.

---

## 4️⃣ Step 3: Configure AWS CLI

1. Open terminal or VS Code.

2. Run:

```bash
aws configure
```
Enter Access Key ID and Secret Access Key from the CSV.

Default region: us-east-1 (or your preferred region)

Default output format: json

Verify configuration:
```bash
aws sts get-caller-identity
```
Output should show your IAM user's ARN and account ID.
## 5️⃣ Step 4: Test Access by Listing EC2 Instances
```bash
aws ec2 describe-instances \
    --query "Reservations[].Instances[].{ID:InstanceId,State:State.Name,IP:PublicIpAddress,Tags:Tags}" \
    --output table
```
You should see a table of EC2 instances (if any exist in your region).
Optional: Specify Region
```bash
aws ec2 describe-instances --region us-east-1 \
    --query "Reservations[].Instances[].{ID:InstanceId,State:State.Name,IP:PublicIpAddress,Tags:Tags}" \
    --output table

## 6️⃣ Step 5: Troubleshooting

AccessDenied → Check that the IAM user has AdministratorAccess.

No instances found → Confirm you are in the correct AWS region.

AWS CLI not recognized → Ensure AWS CLI is installed and added to PATH.

## ✅ Key Takeaways

IAM Users allow secure access to AWS resources.

AdministratorAccess grants full AWS permissions (use with caution).

AWS CLI allows managing AWS resources from your terminal or VS Code.

Always verify region and credentials when testing.
