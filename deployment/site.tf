module "prometheus" {
  source = "../prometheus_all"
  enabled_modules = [
    "influxdb",
    "prometheus",
    "grafana",
    "paas_prometheus_exporter",
  ]

  monitoring_org_name      = local.org_name
  monitoring_space_name    = "monitoring"
  monitoring_instance_name = "notify"

  grafana_postgres_plan        = "small-11"
  grafana_github_client_id     = data.pass_password.grafana_github_client_id.password
  grafana_github_client_secret = data.pass_password.grafana_github_client_secret.password
  grafana_github_team_ids = [
    1789721 # notify
  ]

  grafana_aws_datasources = [
    {
      "name"                    = "Cell broadcasts staging",
      "region"                  = "eu-west-2",
      "access_key"              = data.pass_password.grafana_emergency_alerts_staging_aws_access_key_id.password,
      "secret_key"              = data.pass_password.grafana_emergency_alerts_staging_aws_secret_access_key.password,
      "customMetricsNamespaces" = "CBCProxy,Strongswan",
    },
    {
      "name"                    = "Cell broadcasts prod",
      "region"                  = "eu-west-2",
      "access_key"              = data.pass_password.grafana_emergency_alerts_prod_aws_access_key_id.password,
      "secret_key"              = data.pass_password.grafana_emergency_alerts_prod_aws_secret_access_key.password,
      "customMetricsNamespaces" = "CBCProxy,Strongswan",
    }
  ]

  influxdb_service_plan = "small-1_x"

  paas_exporter_username = data.pass_password.prometheus_exporter_username.password
  paas_exporter_password = data.pass_password.prometheus_exporter_password.password

  internal_apps = concat(local.cross_space_apps, keys(local.internal_apps))

  prometheus_disk_quota          = 4096
  prometheus_memory              = 4096
  prometheus_basic_auth_password = data.pass_password.basic_auth_password.password
  prometheus_shared_token        = data.pass_password.prometheus_shared_token.password
}
