# Demo: Installing a Web Server on Amazon Linux & Testing Security Groups

This guide demonstrates how to deploy a simple Apache (`httpd`) web server on an **Amazon Linux EC2 instance** and test the role of **Security Groups (SGs)**.

---

## 1️⃣ Prerequisites

- An **AWS account** with permissions to launch EC2 instances.
- Basic familiarity with the AWS Management Console or CLI.
- An existing **key pair** for SSH access.

---

## 2️⃣ Launch an EC2 Instance

1. **Select an AMI**:  
   - Amazon Linux 2 or Amazon Linux 2023.

2. **Instance type**:  
   - `t2.micro` (Free Tier eligible).

3. **Security Group configuration**:  
   - **Inbound rules**:
     - HTTP (port 80) from `0.0.0.0/0` for demo purposes.  
       > ⚠️ In production, restrict to specific IPs.
     - SSH (port 22) from **your IP only**.

4. Launch the instance and note the **Public IPv4 address**.

---

## 3️⃣ Connect to the Instance

```bash
ssh -i your-key.pem ec2-user@<PUBLIC_IP>
```

## 4️⃣ Install and Start Apache HTTP Server
```bash
# Update installed packages
sudo yum update -y

# Install httpd (Apache)
sudo yum install -y httpd

# Enable Apache to start on boot
sudo systemctl enable httpd

# Start Apache service
sudo systemctl start httpd

# Verify status
sudo systemctl status httpd
```

## 5️⃣ Add a Test Web Page
```bash
echo '<h1>Hello from Amazon Linux Web Server!</h1>' | sudo tee /var/www/html/index.html
```

## 6️⃣ Test the Security Group
Browser Test

Open a browser and visit:
```bash
http://<PUBLIC_IP>
```

You should see the "Hello from Amazon Linux Web Server!" message.

## Port Restriction Demo

Go to EC2 Console → Security Groups → Edit inbound rules.

Remove the HTTP (port 80) rule or change the source to a specific IP.

Refresh the browser page.

❌ The page will fail to load because inbound traffic is blocked.

Re-add the HTTP rule to restore access.

Explanation:
Security Groups act as a virtual firewall. Even if the web server is running, traffic is blocked unless the SG allows it.

## 7️⃣ Optional: Clean Up

Terminate the EC2 instance when done to avoid unnecessary charges.

## 8️⃣ Key Takeaways

Apache (httpd) serves the web page.

Security Groups control network access.

Both must be configured correctly:

The service must listen on a port.

The Security Group must allow traffic to that port.
