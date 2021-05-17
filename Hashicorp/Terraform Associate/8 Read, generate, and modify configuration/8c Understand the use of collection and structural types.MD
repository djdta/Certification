# 8c Understand the use of collection and structural types

## Summary

A complex type is a type that groups multiple values into a single value. Complex types are represented by type constructors, but several of them also have shorthand keyword versions.

There are two categories of complex types: collection types (for grouping similar values), and structural types (for grouping potentially dissimilar values).

## Collection Types

A collection type allows multiple values of one other type to be grouped together as a single value. The type of value within a collection is called its element type. All collection types must have an element type, which is provided as the argument to their constructor.

For example, the type list(string) means "list of strings", which is a different type than list(number), a list of numbers. All elements of a collection must always be of the same type.

The three kinds of collection type in the Terraform language are:

* list(...): a sequence of values identified by consecutive whole numbers starting with zero.

The keyword list is a shorthand for list(any), which accepts any element type as long as every element is the same type. This is for compatibility with older configurations; for new code, we recommend using the full form.

* map(...): a collection of values where each is identified by a string label.

The keyword map is a shorthand for map(any), which accepts any element type as long as every element is the same type. This is for compatibility with older configurations; for new code, we recommend using the full form.

Maps can be made with braces ({}) and colons (:) or equals signs (=): { "foo": "bar", "bar": "baz" } OR { foo = "bar", bar = "baz" }. Quotes may be omitted on keys, unless the key starts with a number, in which case quotes are required. Commas are required between key/value pairs for single line maps. A newline between key/value pairs is sufficient in multi-line maps.

Note: although colons are valid delimiters between keys and values, they are currently ignored by terraform fmt (whereas terraform fmt will attempt vertically align equals signs).

* set(...): a collection of unique values that do not have any secondary identifiers or ordering.

## Structural Types

A structural type allows multiple values of several distinct types to be grouped together as a single value. Structural types require a schema as an argument, to specify which types are allowed for which elements.

The two kinds of structural type in the Terraform language are:

object(...): a collection of named attributes that each have their own type.

The schema for object types is { <KEY> = <TYPE>, <KEY> = <TYPE>, ... } — a pair of curly braces containing a comma-separated series of <KEY> = <TYPE> pairs. Values that match the object type must contain all of the specified keys, and the value for each key must match its specified type. (Values with additional keys can still match an object type, but the extra attributes are discarded during type conversion.)

* tuple(...): a sequence of elements identified by consecutive whole numbers starting with zero, where each element has its own type.

The schema for tuple types is [<TYPE>, <TYPE>, ...] — a pair of square brackets containing a comma-separated series of types. Values that match the tuple type must have exactly the same number of elements (no more and no fewer), and the value in each position must match the specified type for that position.

For example: an object type of object({ name=string, age=number }) would match a value like the following:

```
{
  name = "John"
  age  = 52
}
```

Also, an object type of object({ id=string, cidr_block=string }) would match the object produced by a reference to an aws_vpc resource, like aws_vpc.example_vpc; although the resource has additional attributes, they would be discarded during type conversion.

Finally, a tuple type of tuple([string, number, bool]) would match a value like the following:

["a", 15, true]

## Complex Type Literals

The Terraform language has literal expressions for creating tuple and object values, which are described in Expressions: Literal Expressions as "list/tuple" literals and "map/object" literals, respectively.

Terraform does not provide any way to directly represent lists, maps, or sets. However, due to the automatic conversion of complex types (described below), the difference between similar complex types is almost never relevant to a normal user, and most of the Terraform documentation conflates lists with tuples and maps with objects. The distinctions are only useful when restricting input values for a module or resource.

## Conversion of Complex Types

Similar kinds of complex types (list/tuple/set and map/object) can usually be used interchangeably within the Terraform language, and most of Terraform's documentation glosses over the differences between the kinds of complex type. This is due to two conversion behaviors:

Whenever possible, Terraform converts values between similar kinds of complex types if the provided value is not the exact type requested. "Similar kinds" is defined as follows:
Objects and maps are similar.

A map (or a larger object) can be converted to an object if it has at least the keys required by the object schema. Any additional attributes are discarded during conversion, which means map -> object -> map conversions can be lossy.
Tuples and lists are similar.

A list can only be converted to a tuple if it has exactly the required number of elements.
Sets are almost similar to both tuples and lists:
When a list or tuple is converted to a set, duplicate values are discarded and the ordering of elements is lost.

When a set is converted to a list or tuple, the elements will be in an arbitrary order. If the set's elements were strings, they will be in lexicographical order; sets of other element types do not guarantee any particular order of elements.

Whenever possible, Terraform converts element values within a complex type, either by converting complex-typed elements recursively or as described above in Conversion of Primitive Types.
For example: if a module argument requires a value of type list(string) and a user provides the tuple ["a", 15, true], Terraform will internally transform the value to ["a", "15", "true"] by converting the elements to the required string element type. Later, if the module uses those elements to set different resource arguments that require a string, a number, and a bool (respectively), Terraform will automatically convert the second and third strings back to the required types at that time, since they contain valid representations of a number and a bool.

On the other hand, automatic conversion will fail if the provided value (including any of its element values) is incompatible with the required type. If an argument requires a type of map(string) and a user provides the object 

{name = ["Kristy", "Claudia", "Mary Anne", "Stacey"], age = 12}, 

Terraform will raise a type mismatch error, since a tuple cannot be converted to a string.

## Dynamic Types: The "any" Constraint

The keyword any is a special construct that serves as a placeholder for a type yet to be decided. any is not itself a type: when interpreting a value against a type constraint containing any, Terraform will attempt to find a single actual type that could replace the any keyword to produce a valid result.

For example, given the type constraint list(any), Terraform will examine the given value and try to choose a replacement for the any that would make the result valid.

If the given value were ["a", "b", "c"] -- whose physical type is tuple([string, string, string]), Terraform analyzes this as follows:

Tuple types and list types are similar per the previous section, so the tuple-to-list conversion rule applies.

All of the elements in the tuple are strings, so the type constraint string would be valid for all of the list elements.

Therefore in this case the any argument is replaced with string, and the final concrete value type is list(string).

All of the elements of a collection must have the same type, so conversion to list(any) requires that all of the given elements must be convertible to a common type. This implies some other behaviors that result from the conversion rules described in earlier sections.

If the given value were instead ["a", 1, "b"] then Terraform would still select list(string), because of the primitive type conversion rules, and the resulting value would be ["a", "1", "b"] due to the string conversion implied by that type constraint.
If the given value were instead ["a", [], "b"] then the value cannot conform to the type constraint: there is no single type that both a string and an empty tuple can convert to. Terraform would reject this value, complaining that all elements must have the same type.
Although the above examples use list(any), a similar principle applies to map(any) and set(any).

If you wish to apply absolutely no constraint to the given value, the any keyword can be used in isolation:

```
variable "no_type_constraint" {
  type = any
}
```

In this case, Terraform will replace any with the exact type of the given value and thus perform no type conversion whatsoever.

## Experimental: Optional Object Type Attributes

From Terraform v0.14 there is experimental support for marking particular attributes as optional in an object type constraint.

To mark an attribute as optional, use the additional optional(...) modifier around its type declaration:

```
variable "with_optional_attribute" {
  type = object({
    a = string           # a required attribute
    b = optional(string) # an optional attribute
  })
}
```
By default, for required attributes, Terraform will return an error if the source value has no matching attribute. Marking an attribute as optional changes the behavior in that situation: Terraform will instead just silently insert null as the value of the attribute, allowing the recieving module to describe an appropriate fallback behavior.

Because this feature is currently experimental, it requires an explicit opt-in on a per-module basis. To use it, write a terraform block with the experiments argument set as follows:

```
terraform {
  experiments = [module_variable_optional_attrs]
}
```

Until the experiment is concluded, the behavior of this feature may see breaking changes even in minor releases. We recommend using this feature only in prerelease versions of modules as long as it remains experimental.

https://www.terraform.io/docs/configuration/types.html#complex-types