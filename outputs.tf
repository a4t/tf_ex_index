output "index" {
  value = length(local.tmp_list) == length(var.list) ? index(var.list, var.value) : -1
}
