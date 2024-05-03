
Crea un archivo llamado credentials.tfvars que contenga lo siguiente:

aws_access_key = "TU_ACCESS_KEY_AQUI"
aws_secret_key = "TU_SECRET_KEY_AQUI"
aws_region     = "TU_REGION_AQUI"

Reemplaza los valores asignados por las key verdaderas, al igual que la región. Estos valores serán utilizados por el credentials.tf 


Implementación:

Inicializa Terraform: Abre una terminal en el directorio de tu proyecto y ejecuta el comando 'terraform init' para inicializar Terraform y descargar los proveedores necesarios.

Planifica la implementación: Ejecuta 'terraform plan -out=infra_test.plan -var-file=credentials.tfvars' para ver qué recursos se crearán en AWS según tu configuración.

Leer el plan: terraform show infra_test.plan

Aplica los cambios: Una vez revisado el plan, ejecuta 'terraform apply -var-file=credentials.tfvars'  para crear la infraestructura en AWS.

Limpieza:

Destruye la infraestructura: Si ya no necesitas la infraestructura, ejecuta 'terraform destroy -var-file=credentials.tfvars' para eliminar todos los recursos creados por Terraform y así no consumir recursos en AWS



-auto-approve