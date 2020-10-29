# README.md

Here you will find the teraform script to create a [openvpn](https://openvpn.net) instance in GCP. This tf has been inspired from [TerraformOpenVPN](https://github.com/gudlyf/TerraformOpenVPN/)


## Prerequisites

- service account (json file)
- require necessary permission to create resources
- terraform

## How to use?

- Clone the repo and change the directory 
*$ cd openvpn*
- Activate google service account
*$ gcloud config set account `ACCOUNT`*
- Replace content inside account.json file
- Create ssh keys inside certs folder
*$ ssh-keygen -N '' -f ./certs/ovpn*
- Change the variables in **variables.tf**
- Apply it
    ```
    $ terraform plan
    $ terraform validate
    $ terraform apply
    ```
Try ssh into the instance
`$ gcloud compute ssh ovpn --zone europe-west2-c`
    
Change the openvpn user password
`$ passwd openvpn`
   
Access openvpn admin
**https://instance-ip/admin**
