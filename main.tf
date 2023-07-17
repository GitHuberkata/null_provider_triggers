terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "null_resource" "screen_output" {
count = 1
  provisioner "local-exec" {
    command = <<-EOT
    aws --version
EOT
  }
}

output "IDserver2" {
  value = "${null_resource.screen_output[2].id}"
}
