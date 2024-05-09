# image
data "ibm_is_image" "this" {
  name = var.vsi_image_name
}

# Resource Group
data "ibm_resource_group" "primary" {
  name = var.resource_group_name
}

# VPC
data "ibm_is_vpc" "primary" {
  name = var.vpc_name
}

# ssh-key
data "ibm_is_ssh_key" "keys" {
  count = length(var.ssh_key_names)
  name  = var.ssh_key_names[count.index]
}

# fip
resource "ibm_is_floating_ip" "this" {
  count          = var.floating_ip ? 1 : 0
  name           = "${var.instance_name}-fip"
  zone           = var.zone
  resource_group = data.ibm_resource_group.primary.id
  tags           = var.tags
}

resource "ibm_is_virtual_network_interface_floating_ip" "this" {
  count                     = var.floating_ip ? 1 : 0
  virtual_network_interface = ibm_is_virtual_network_interface.this.id
  floating_ip               = ibm_is_floating_ip.this[0].id
}

# vni
resource "ibm_is_virtual_network_interface" "this" {
  name                      = format("%s-vni", var.instance_name)
  allow_ip_spoofing         = false
  enable_infrastructure_nat = true
  subnet                    = var.subnet_id
  security_groups           = values(var.security_groups)
}

# vsi
resource "ibm_is_instance" "this" {
  name    = var.instance_name
  image   = data.ibm_is_image.this.id
  profile = var.profile

  primary_network_attachment {
    name = format("%s-primary-att", var.instance_name)
    virtual_network_interface {
      id = ibm_is_virtual_network_interface.this.id
    }
  }

  vpc  = data.ibm_is_vpc.primary.id
  zone = var.zone
  keys = data.ibm_is_ssh_key.keys.*.id

  timeouts {
    create = "15m"
    update = "15m"
    delete = "15m"
  }

  resource_group = data.ibm_resource_group.primary.id
  tags           = var.tags
}
