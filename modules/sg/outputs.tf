output "security_group_ids" {
  value = {
    "sg_dmz"     = opentelekomcloud_networking_secgroup_v2.security_group1.id
    "sg_prod"    = opentelekomcloud_networking_secgroup_v2.security_group2.id
    "sg_opsmgmt" = opentelekomcloud_networking_secgroup_v2.security_group3.id
  }
}
