


data "http" "flow_json" {
  count = var.flow_url != null ? 1 : 0

  url = var.flow_url
  request_headers = {
    Accept = "application/json"
  }
}
resource "davinci_flow" "flow_json" {
  count = var.flow_url != null ? 1 : 0

  flow_json = data.http.flow_json[0].response_body

  deploy = true
}
resource "davinci_connection" "connection" {
  count = var.connection.id != null ? 1 : 0

  name         = var.connection.name
  connector_id = var.connection.id
}





