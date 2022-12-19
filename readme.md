Configure seu arquivo ~.aws/credentials
terraform init
terraform plan
terraform apply -auto-pprove

Nesse repositorio, vai ser criado uma instancia ec2 e um bucket. Contendo uma api em python, que executa a cada hora, criando um txt com a hora de criação,
e fazendo o upload para o s3.
