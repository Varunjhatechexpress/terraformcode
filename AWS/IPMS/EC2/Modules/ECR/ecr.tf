resource "aws_ecr_repository" "ifx-stage-ecr" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "infineon-devops-docker-image" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "intg-assetsandmedia" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "intg-common" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "intg-coveo" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "intg-eloqua" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "intg-idc" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "intg-khoros" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}


resource "aws_ecr_repository" "intg-myicp" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}


resource "aws_ecr_repository" "intg-umantis" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}


resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "ipms-core" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}

resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}

resource "aws_ecr_repository" "test" {
  name                 = var.ecr_name
  image_tag_mutability = var.image_mutability
  encryption_configuration {
    encryption_type = var.encrypt_type
  }

tags = {
    stream = var.stream
    Enviroment = var.deploy_environment
    region     = var.aws_region
  }

}

resource "aws_ecr_registry_scanning_configuration" "configuration" {
  scan_type = "ENHANCED"

}