# Deploying My First Website to Amazon S3

This guide explains how to host a static website in an Amazon S3 bucket.

---

## Prerequisites
- An AWS account
- AWS CLI configured **or** access to the AWS Management Console
- A folder with your static site files (HTML, CSS, JS, images)

---

## 1️⃣ Create an S3 Bucket
1. Go to **AWS Console → S3 → Create bucket**.
2. Enter a globally unique bucket name (e.g., `my-first-s3-website`).
3. Choose a region close to your users.
4. **Important**: Uncheck **Block *all* public access** (you will enable public read).
5. Confirm and create the bucket.

---

## 2️⃣ Enable Static Website Hosting
1. Open your bucket → **Properties** tab.
2. Scroll to **Static website hosting** → **Edit**.
3. Select **Enable**.
4. Set:
   * **Index document**: `index.html`
   * **Error document**: `error.html` (optional but recommended)
5. Save changes.
6. Note the **Bucket website endpoint** – this will be your site’s URL.

---

## 3️⃣ Turn Off “Block Public Access”
- If you did not uncheck it while creating the bucket,  
  go to **Permissions → Block public access settings** → **Edit** →  
  Disable “Block all public access” and save.

---

## 4️⃣ Enable ACLs from Object Ownership
1. In the bucket **Permissions** tab, open **Object Ownership**.
2. Click **Edit**.
3. Select **ACLs enabled** and save.

This allows you to use Access Control Lists (ACLs) to make objects public.

---

## 5️⃣ Upload Your Website Files
- Click **Upload**, add all site files (HTML, CSS, JS, images).
- Make sure the folder structure is preserved (e.g., `images/`).

---

## 6️⃣ Make Objects Public Using ACL
1. Select all uploaded objects.
2. Choose **Actions → Make public using ACL**.
3. Confirm.

This grants public `READ` access so visitors can load your site.

---

## 7️⃣ Test Your Website
- Visit the **Bucket website endpoint** you noted earlier.
- Your static site should load.

---

## Optional: Use a Custom Domain and HTTPS
- Configure an Amazon Route 53 hosted zone or another DNS provider.
- Add a CloudFront distribution for HTTPS support and caching.

---

### Helpful AWS Docs
- [Hosting a Static Website on Amazon S3](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [Configuring a Bucket for Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/HowDoIWebsiteConfiguration.html)

---

**Done!** 🎉 Your website is live on Amazon S3.
