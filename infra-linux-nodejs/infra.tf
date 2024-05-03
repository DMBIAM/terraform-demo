resource "aws_instance" "infraNodejs" {
    ami           = "ami-086f060214da77a16"
    instance_type = "t2.micro"

    # Asocia el grupo de seguridad existente a la instancia EC2
    # security_groups = [data.aws_security_group.infraNodejsPolicy.id]
    
    tags = {
        Name = "infra-instance-nodejs-0"
    }

    user_data = <<-EOF
                #!/bin/bash
                sudo yum update
                sudo yum install -y git nodejs npm

                git clone https://github.com/DMBIAM/RestApiNodeJs.git /app
                cd /app/rest
                EOF
}

resource "aws_security_group" "infraNodejsPolicy" {
  name        = "infraNodejsPolicy"
  description = "Security group for Node.js instance"

  # Regla para permitir el tráfico entrante en el puerto 8000 desde cualquier dirección IP
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Opcional: Regla para permitir el tráfico saliente hacia cualquier dirección IP y puerto
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
