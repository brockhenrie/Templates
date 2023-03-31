
# * CONTAINERS
variable "gondor_password" {
 type      = string
 sensitive = true
 default   = "B@ckspace1"
}

variable "gondor_user" {
 type      = string
 sensitive = true
 default   = "mantis"
}
# * Bird - This VM Hosts Container Services
resource "proxmox_vm_qemu" "gondor" {
 vmid        = "401"
 name        = "gondor"
 target_node = "proxmox"
 desc        = "Gondor container server"
 os_type     = "cloud-init"
 ciuser      = var.gondor_user
 cipassword  = var.gondor_password
 clone       = "containers-server"
 onboot      = true
 agent       = 1
 cores       = 4
 sockets     = 1
 cpu         = "host"
 memory      = 4096
 balloon     = 1024
 network {
   bridge = "vmbr1"
   model  = "virtio"
   tag    = 4
 }
 ipconfig0  = "ip=10.10.4.10/24,gw=10.10.4.1"
 nameserver = "1.1.1.1"
}

