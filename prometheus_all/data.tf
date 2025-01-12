data "cloudfoundry_org" "org" {
  name = var.monitoring_org_name
}

data "cloudfoundry_space" "monitoring" {
  name = var.monitoring_space_name
  org  = data.cloudfoundry_org.org.id
}

data "cloudfoundry_domain" "cloudapps" {
  name = "cloudapps.digital"
}
