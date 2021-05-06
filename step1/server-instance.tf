resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_security_group" "www" {
  name = "Standard http https ssh"
  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
  }

  inbound_rule {
    action = "accept"
    port   = "80"
  }

  inbound_rule {
    action = "accept"
    port   = "443"
  }
}

resource "scaleway_instance_server" "web" {
  name  = "raising-unicorn-server-${terraform.workspace}"
  type  = "DEV1-S"
  image = "ubuntu_focal"

  tags = [terraform.workspace]

  ip_id = scaleway_instance_ip.public_ip.id

  additional_volume_ids = [ ]

  security_group_id = scaleway_instance_security_group.www.id
}
