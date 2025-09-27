# Demo: Launching Your First EC2 Free Tier Instance & Connecting via SSH

This guide walks you through launching a **Free Tier Amazon EC2 instance** and connecting to it securely using SSH.

---

## 1️⃣ Prerequisites

- An **AWS account**.
- Basic familiarity with AWS Management Console.
- A web browser for AWS Console access.
- An existing **key pair** or ability to create one in AWS.

---

## 2️⃣ Launch a Free Tier EC2 Instance

1. **Log in** to the [AWS Management Console](https://aws.amazon.com/console/).

2. **Navigate to EC2 Dashboard**:  
   - Services → Compute → EC2 → Instances → Launch Instances.

3. **Step 1: Choose an Amazon Machine Image (AMI)**  
   - Select **Amazon Linux 2 AMI (Free Tier Eligible)**.

4. **Step 2: Choose an Instance Type**  
   - Select **t2.micro** (Free Tier eligible).

5. **Step 3: Configure Instance Details**  
   - Leave default settings for demo purposes.

6. **Step 4: Add Storage**  
   - Default 8 GB is sufficient for this demo.

7. **Step 5: Add Tags** (Optional)  
   - Example: Name → `MyFirstEC2`.

8. **Step 6: Configure Security Group**  
   - **Create a new security group** or select an existing one.
   - Add **Inbound rules**:
     - **SSH (port 22)** → Source: Your IP only.
     - **HTTP (port 80)** → Source: 0.0.0.0/0 (optional, for web server demo).

9. **Step 7: Review and Launch**  
   - Click **Launch**.
   - Select an **existing key pair** or create a new one.
   - **Download the `.pem` key file** if creating a new key. Keep it safe.

10. Click **Launch Instances** and note the **Public IPv4 address**.

---

## 3️⃣ Connect to Your EC2 Instance Using SSH

1. Open a terminal (Linux/Mac) or use **Git Bash / WSL** on Windows.

2. Ensure your key has proper permissions:

```bash
chmod 400 your-key.pem
```

## Connect to the instance:
```bash

ssh -i your-key.pem ec2-user@<PUBLIC_IP>
```

Replace <PUBLIC_IP> with the IPv4 address of your instance.

If successful, you will see:
```bash
[ec2-user@ip-xx-xx-xx-xx ~]$
```

## 4️⃣ Verify Your Instance
```bash
# Check system info
uname -a

# Check uptime
uptime
```
