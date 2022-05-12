variable "cloudfoundry_sso_passcode" {}

locals {
  org_name = "govuk-notify"
  spaces = [
    "preview",
    "staging",
    "production",
  ]
  internal_apps_per_space = [
    "notify-statsd-exporter",
    "notify-api",
    "notify-admin",
  ]
  cross_space_apps = {
    "notify-prometheus-exporter.apps.internal" = {
      space    = "monitoring"
      app_name = "notify-prometheus-exporter"
    }
  }

  internal_apps = {
    for pair in setproduct(local.spaces, local.internal_apps_per_space) : "${pair[1]}-${pair[0]}.apps.internal" => {
      space    = pair[0]
      app_name = pair[1]
    }
  }
}
