


data "http" "flow_json" {
  url = var.flow_url
  request_headers = {
    Accept = "application/json"
  }
}
resource "davinci_flow" "flow_json" {
  flow_json = data.http.flow_json.response_body

  deploy = true

  # depends_on = [
  #   pingone_role_assignment_user.admin_role
  # ]
}




