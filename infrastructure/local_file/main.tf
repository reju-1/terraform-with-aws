resource "local_file" "my_file" {
  filename        = "demo.txt"
  content         = "Hello World\n"
  file_permission = "0766"
}
