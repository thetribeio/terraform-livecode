resource "scaleway_instance_server" "web" {
  name  = "raising-unicorn-server-${terraform.workspace}-${count.index}"
  type  = "DEV1-S"
  image = "ubuntu_focal"
  count = 3

  tags = [terraform.workspace]

  additional_volume_ids = [ ]

  security_group_id = scaleway_instance_security_group.www.id
}
