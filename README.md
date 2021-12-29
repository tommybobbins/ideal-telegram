# ideal-telegram
Create LFS260 Kubernetes Security Essentials (LFS260) labs on Google Cloud Platform with terraform

## Installing
A GCP service account key: Create a service account key to enable Terraform to access your GCP account. When creating the key, use the following settings:

Select the project you created in the previous step.
Click "Create Service Account".
Give it any name you like and click "Create".
For the Role, choose "Project -> Editor", then click "Continue".
Skip granting additional users access, and click "Done".
After you create your service account, download your service account key.

Select your service account from the list.
Select the "Keys" tab.
In the drop down menu, select "Create new key".
Leave the "Key Type" as JSON.
Click "Create" to create the key and save the key file to your system.

https://console.cloud.google.com/projectselector/iam-admin/serviceaccounts?supportedpurview=project


    terraform apply -var-file=secret.tfvars --auto-approve

## Removing

Use terraform destroy to remove instances
    terraform destroy -var-file=secret.tfvars --auto-approve
