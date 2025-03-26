resource "opentelekomcloud_networking_port_v2" "ports" {
  for_each = var.ports

  name       = each.key
  network_id = lookup(var.subnet_ids, each.value.subnet_name)

  security_group_ids = [
    for sg in each.value.security_group_names :
    lookup(var.security_group_ids, sg)
  ]

  admin_state_up = true
}
#-----------------------------------------------------------------------------------

resource "opentelekomcloud_compute_instance_v2" "instances" {
  count       = length(var.instances)
  name        = var.instances[count.index].name
  flavor_name = var.instances[count.index].flavor
  image_id    = var.instances[count.index].image_id
  key_pair    = var.ssh_key_name
  availability_zone = var.instances[count.index].availability_zone 

  # Attach multiple NICs via ports
  dynamic "network" {
  for_each = toset(var.instances[count.index].port_names)
  content {
      port = opentelekomcloud_networking_port_v2.ports[network.value].id
    }
  }
}
#-----------------------------------------------------------------------------------


