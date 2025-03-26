
resource "opentelekomcloud_networking_secgroup_v2" "security_group1" {
  name        = var.security_group1_name
  description = "Security group for ${var.security_group1_name}"
}

resource "opentelekomcloud_networking_secgroup_v2" "security_group2" {
  name        = var.security_group2_name
  description = "Security group for ${var.security_group2_name}"
}

resource "opentelekomcloud_networking_secgroup_v2" "security_group3" {
  name        = var.security_group3_name
  description = "Security group for ${var.security_group3_name}"
}




#------------------------------------------------------------------------------------
# Rules for Security Group 1
#------------------------------------------------------------------------------------
# Allow HTTP (80) from the Internet to the DMZ
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_dmz_http_in" {
  security_group_id = opentelekomcloud_networking_secgroup_v2.security_group1.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
}

# Allow HTTPS (443) from the Internet to the DMZ
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_dmz_https_in" {
  security_group_id = opentelekomcloud_networking_secgroup_v2.security_group1.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
}




#------------------------------------------------------------------------------------
# Rules for Security Group 2
#------------------------------------------------------------------------------------

# Allow HTTP (80) from DMZ to the Production LAN
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_prod_http_in" {
  security_group_id = opentelekomcloud_networking_secgroup_v2.security_group2.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_group_id = opentelekomcloud_networking_secgroup_v2.security_group1.id
}

# Allow HTTPS (443) from DMZ to the Production LAN
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_prod_https_in" {
  security_group_id = opentelekomcloud_networking_secgroup_v2.security_group2.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_group_id = opentelekomcloud_networking_secgroup_v2.security_group1.id
}





#------------------------------------------------------------------------------------
# Rules for Security Group 3
#------------------------------------------------------------------------------------

# Allow SSH (22) from trusted IPs (e.g., VPN)
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_mgmt_ssh_in" {
  security_group_id = opentelekomcloud_networking_secgroup_v2.security_group3.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "10.168.150.0/24" 
}

# Allow RDP (3389) from trusted IPs (e.g., VPN)
resource "opentelekomcloud_networking_secgroup_rule_v2" "sg_mgmt_rdp_in" {
  security_group_id = opentelekomcloud_networking_secgroup_v2.security_group3.id
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 3389
  port_range_max    = 3389
  remote_ip_prefix  = "10.168.150.0/24"
}
#------------------------------------------------------------------------------------
