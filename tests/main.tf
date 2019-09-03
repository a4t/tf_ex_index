module "ex_index_1" {
  source = "../"
  list   = var.my_list
  value  = "d"
}

module "ex_index_2" {
  source = "../"
  list   = var.my_list
  value  = "a"
}

output test_ex_index_1 {
  value = module.ex_index_1.index == -1 ? "ok" : "failures"
}

output test_ex_index_2 {
  value = module.ex_index_2.index == 0 ? "ok" : "failures"
}
