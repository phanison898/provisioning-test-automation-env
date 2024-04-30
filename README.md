### Test Automation Provision

![](https://img.shields.io/github/languages/code-size/phanison898/provisioning-test-automation-env?style=flat-square)
![](https://img.shields.io/github/last-commit/phanison898/provisioning-test-automation-env?style=flat-square)
![](https://img.shields.io/github/languages/top/phanison898/provisioning-test-automation-env?style=flat-square)
![](https://img.shields.io/github/license/phanison898/provisioning-test-automation-env?style=flat-square)

---

#### 🚥 About

As a SDET, I have to setup **`Test Automation Environment`** for running tests in parallel and cross browser mode across different operating systems. Setting up this requirements using traditional selenium grid configuration using on premies servers takes a lot of time and maintenance is tidius job. With the help of AWS and Docker coupled with Terraform, we can acheive similar configuration just in span of few seconds.

---

#### 📜 Tools

- **AWS** : for setting up EC2 instances
- **Docker** : for containarizing the EC2 instance
- **Docker-Compose** : for scaling up or down the browser containers based on requirements
- **Terraform**: for performing all the above steps in a single click

---

#### ⛔ Pre-requisites

1. **Terraform** installation
   - Download latest version of Terraform from <a href="https://developer.hashicorp.com/terraform/install">the official page</a> based on your operating system
   - Extract the zip and include it in System Environment Path variable
2. **AWS** account setup
   - Create a new AWS account if not already created
   - In security credentials panel, create an access_key and make note of `access_key_name` and `secret_key`
   - Create `public key` for accessing EC2 instances and download .pem file and store it in local device

---

#### ✅ How to make use of this repo?

1. Clone the repository
   ```bash
   git clone https://github.com/phanison898/provisioning-test-automation-env.git
   ```
2. CD into cloned directory
   ```bash
   cd /provisioning-test-automation-env
   ```
3. Create secrets.tfvars file with following properties and include your AWS properties

   ```bash
        access_key            =     <YOUR_AWS_ACCESS_KEY>
        secret_key            =     <YOUR_AWS_SECRETS>
        region                =     "us-east-1"
        key_name              =     <YOUR_AWS_PEM_KEY>
        instance_type         =     "t2.micro" # free tier
        ami                   =     "ami-0050e19f8a75d260f" # aws linux 2023 | free tier
        private_key_location  =     "path/to/your/aws/pem/file"

   ```

4. Intialize terraform in current directory

   ```bash
       terraform init
   ```

5. Validate the configurations

   ```bash
       terraform validate
   ```

6. Plan

   ```bash
       terraform plan -var-file="secrets.tfvars"
   ```

7. Apply

   ```bash
       terraform apply -var-file="secrets.tfvars" -auto-approve
   ```

---

#### 🖋 Selenium Hub | docker-compose.yml file configuration

![Selenium Hub](https://raw.githubusercontent.com/phanison898/github-drive/main/selenium_hub_yaml_file.png)

---

#### 📑 Terraform main resourses configuration file

![Terraform main](https://raw.githubusercontent.com/phanison898/github-drive/main/terraform_main_file.png)

---

#### Terraform Spin-Up logs

![terraform spin up](https://raw.githubusercontent.com/phanison898/github-drive/main/terraform_spin_up_logs.png)
