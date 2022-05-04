data "pass_password" "basic_auth_password" {
  path = "credentials/http_auth/notify/password"
}

data "pass_password" "grafana_github_client_id" {
  path = "credentials/monitoring/grafana-github-oauth-client-id"
}

data "pass_password" "grafana_github_client_secret" {
  path = "credentials/monitoring/grafana-github-oauth-client-secret"
}

data "pass_password" "prometheus_shared_token" {
  path = "credentials/monitoring/prometheus-shared-token"
}

data "pass_password" "prometheus_exporter_username" {
  path = "credentials/monitoring/prometheus-exporter-paas-username"
}

data "pass_password" "prometheus_exporter_password" {
  path = "credentials/monitoring/prometheus-exporter-paas-password"
}

data "pass_password" "grafana_emergency_alerts_staging_aws_access_key_id" {
  path = "credentials/monitoring/grafana-emergency-alerts-staging-aws-access-key-id"
}

data "pass_password" "grafana_emergency_alerts_staging_aws_secret_access_key" {
  path = "credentials/monitoring/grafana-emergency-alerts-staging-aws-secret-access-key"
}

data "pass_password" "grafana_emergency_alerts_prod_aws_access_key_id" {
  path = "credentials/monitoring/grafana-emergency-alerts-prod-aws-access-key-id"
}

data "pass_password" "grafana_emergency_alerts_prod_aws_secret_access_key" {
  path = "credentials/monitoring/grafana-emergency-alerts-prod-aws-secret-access-key"
}
