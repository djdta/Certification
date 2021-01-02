## 4a Given a scenario: choose when to use terraform fmt to format code

#### Summary

The terraform fmt command is used to rewrite Terraform configuration files to a canonical format and style. This command applies a subset of the Terraform language style conventions, along with other minor adjustments for readability.

#### Key Information

* Use empty lines to separate logical groups of arguments within a block.
* For blocks that contain both arguments and "meta-arguments" (as defined by the Terraform language semantics), list meta-arguments first and separate them from other arguments with one blank line. Place meta-argument blocks last and separate them from other blocks with one blank line.
* When both arguments and blocks appear together inside a block body, place all of the arguments together at the top and then place nested blocks below them. Use one blank line to separate the arguments from the blocks.
* When multiple arguments with single-line values appear on consecutive lines at the same nesting level, align their equals signs:
* Indent two spaces for each nesting level.

#### Usage

* -list=false - Don't list the files containing formatting inconsistencies.
* -write=false - Don't overwrite the input files. (This is implied by -check or when the input is STDIN.)
* -diff - Display diffs of formatting changes
* -check - Check if the input is formatted. Exit status will be 0 if all input is properly formatted and non-zero otherwise.
* -recursive - Also process files in subdirectories. By default, only the given directory (or current directory) is processed.

| Index |
|:----------:|
|[Template](https://www.terraform.io/docs/commands/fmt.html)|