# For a simple local file example (no cloud provider needed initially)
resource "local_file" "example" {
  content  = "Hello from Terraform managed by Jenkins! Current time: ${timestamp()}"
  filename = "hello.txt"
}
