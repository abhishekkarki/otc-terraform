output "instance_ips" {
  value = opentelekomcloud_compute_instance_v2.instances[*].access_ip_v4
}
