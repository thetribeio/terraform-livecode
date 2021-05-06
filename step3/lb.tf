resource "scaleway_lb_ip" "my_lb_ip" {
}

resource "scaleway_lb" "my_lb" {
  ip_id  = scaleway_lb_ip.my_lb_ip.id
  name = "my_lb"
  type   = "LB-S"
}

resource "scaleway_lb_backend" "web_backend" {
  lb_id            = scaleway_lb.my_lb.id
  name             = "web_backend"
  forward_protocol = "http"
  forward_port     = "80"
  server_ips       = scaleway_instance_server.web.*.public_ip
}

resource "scaleway_lb_frontend" "frontend01" {
  lb_id        = scaleway_lb.my_lb.id
  backend_id   = scaleway_lb_backend.web_backend.id
  name         = "web_frontend"
  inbound_port = "80"
}
