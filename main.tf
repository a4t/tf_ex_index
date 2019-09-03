locals {
  tmp_list = distinct(concat(var.list, [var.value]))
}
