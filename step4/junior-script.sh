scw instance server create type=DEV1-S image=ubuntu_focal zone=fr-par-1 name=raising-unicorn-server-default-2
SERVER_ID=$(scw instance server list | grep "default-2" | cut -d" " -f1)
SERVER_IP=$(scw instance server get $SERVER_ID | grep PrivateIP | cut -d" " -f12)
LB_ID=$(scw lb lb list | tail -n1 | cut -d" " -f1)
BACKEND_ID=$(scw lb backend list lb-id=$LB_ID | tail -n1 | cut -d" " -f1)
scw lb backend add-servers $BACKEND_ID server-ip.0=$SERVER_IP

# terraform import scaleway_instance_server.web\[2\] fr-par-1/$SERVER_ID
# terraform plan -> on voit que l'image c'est pas ça,
#     on doit recréer la machine à cause du count qui fait que 0,1 & 2 ne sont pas iso
#     conclusion -> on fait tout avec terraform!
