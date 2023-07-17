terraform {
  required_providers {
    null = {
      source = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

resource "null_resource" "screen_output" {
count = 4
  provisioner "local-exec" {
    command = <<-EOT
    "aws s3 sync s3://reach-sitebuilder/website_v2.6.0.13-development s3://gryphon-tst-reach-engagement-hub/website_v2.6.0.13-development --source-region ap-southeast-2 --region ap-southeast-2 --quiet --debug"
    # echo 'Hello'
    EOT
  }
}

output "IDserver2" {
  value = "${null_resource.screen_output[2].id}"
}
