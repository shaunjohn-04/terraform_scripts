wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
terraform --v
ls
mkdir terraform
cd terraform
ls
terraform iniy
terraform init
ls
ls -lta
cd
ls
cd terraform
ls
cd terraform
touch main.tf
touch input.tf
touch output.tf
ls
vim input.tf
vim main.tf
vim output.tf
terraform init
terraform plan
terraform apply
ls
terraform apply
ls
cd terraform
cd ..
mkdir terraform_new
cd terraform_new
touch main.tf
touch input.tf
touch output.tf
ls
vim input.tf
vim main.tf
vim output.tf
sudo apt update
sudo apt install awscli
aws configure
