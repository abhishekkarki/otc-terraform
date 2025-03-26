resource "opentelekomcloud_compute_instance_v2" "instances" {
  count       = length(var.instances)
  name        = var.instances[count.index].name
  flavor_name = var.instances[count.index].flavor
  image_id    = var.instances[count.index].image_id
  key_pair    = var.ssh_key_name
  availability_zone = var.instances[count.index].availability_zone 

  # Attach primary subnet
  network {
    uuid = lookup(var.subnet_ids, var.instances[count.index].subnet_names[0])
  }

  # Attach additional subnets if available
  dynamic "network" {
    for_each = slice(var.instances[count.index].subnet_names, 1, length(var.instances[count.index].subnet_names))
    content {
      uuid = lookup(var.subnet_ids, network.value)
    }
  }

  # Attach multiple ports dynamically
  dynamic "network" {
    for_each = toset(var.instances[count.index].port_names)
    content {
      port = opentelekomcloud_networking_port_v2.ports["${var.instances[count.index].name}-${network.value}"].id
    }
  }

  # Attach multiple security groups dynamically
  security_groups = [for sg in var.instances[count.index].security_group_names : lookup(var.security_group_ids, sg)]
}


