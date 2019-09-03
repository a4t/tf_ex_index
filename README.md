# tf_ex_index

This module is an extension of the Terraform function index.

## Why?

Terraform index produces an error if the given value is not present in the list.
https://www.terraform.io/docs/configuration/functions/index.html

But, this module returns -1 if no value exists.


## Usage

```
module "ex_index" {
  source = "github.com/a4t/tf_ex_index"
  list   = [
    "a",
    "b",
    "c"
  ]
  value  = "d"
}

# module.ex_index.index = -1
```

## Test

```
$ make init
$ make test
```
