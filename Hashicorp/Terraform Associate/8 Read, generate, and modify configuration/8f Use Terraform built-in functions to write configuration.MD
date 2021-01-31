## 8f Use Terraform built-in functions to write configuration

## Summary

The Terraform language includes a number of built-in functions that you can call from within expressions to transform and combine values. The general syntax for function calls is a function name followed by comma-separated arguments in parentheses:

```
max(5, 12, 9)
```
For more details on syntax, see Function Calls in the Expressions section.

The Terraform language does not support user-defined functions, and so only the functions built in to the language are available for use. The navigation for this section includes a list of all of the available built-in functions.

You can experiment with the behavior of Terraform's built-in functions from the Terraform expression console, by running the terraform console command:

```
> max(5, 12, 9)
12
```

The examples in the documentation for each function use console output to illustrate the result of calling the function with different parameters.


https://www.terraform.io/docs/configuration/functions.html