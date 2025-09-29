# Day 6: Built-in Functions
terraform doesn't let you create custom functions like python. instead it ships with 100+ built-in functions covering string manipulation, numeric ops, date/time, encoding, filesystem, networking, type conversion, and more.

**if you need custom functionality:**
- write a custom provider in Go
- use community/external providers
- call external scripts via `external` data source
- use `local-exec` provisioners

## Most Used Terraform Built-in Functions
While Terraform offers 100+ built-in functions, these 40 functions cover 95% of typical use cases.

| **Category**          | **Function**     | **Usage / Purpose**                                        |
| --------------------- | ---------------- | ---------------------------------------------------------- |
| **String**            | `lower()`        | Convert string to lowercase (e.g., normalize names).       |
|                       | `upper()`        | Convert string to uppercase.                               |
|                       | `replace()`      | Replace substring or regex match in a string.              |
|                       | `split()`        | Split a string into a list by a delimiter.                 |
|                       | `join()`         | Join list of strings into one with a delimiter.            |
|                       | `trim()`         | Remove specific characters from start and end of a string. |
| **Collection**        | `length()`       | Count elements in a list, map, or string.                  |
|                       | `merge()`        | Merge multiple maps into one.                              |
|                       | `concat()`       | Concatenate lists into one.                                |
|                       | `distinct()`     | Remove duplicate values from a list.                       |
|                       | `element()`      | Return the element at a given index from a list.           |
|                       | `contains()`     | Check if a list has a specific value.                      |
|                       | `lookup()`       | Safely retrieve a value from a map with optional default.  |
|                       | `keys()`         | Extract all keys from a map (very common with for_each)    |
|                       | `values()`       | Extracts all values from a map and returns them as a list. |
|                       | `range()`        | Generate a sequence of numbers as a list.                  |
|                       | `slice()`        | Extract a sublist from a list using start and end indices. |
|                       | `flatten()`      | Flatten nested lists.                                      |
| **Type Conversion**   | `tostring()`     | Convert value to string.                                   |
|                       | `tonumber()`     | Convert string to number.                                  |
|                       | `tobool()`       | Convert value to boolean.                                  |
|                       | `tolist()`       | Convert a value into a list.                               |
|                       | `tomap()`        | Convert a value into a map.                                |
|                       | `toset()`        | Convert a value into a set (unique unordered collection).  |
| **Numeric**           | `min()`          | Return the smallest number.                                |
|                       | `max()`          | Return the largest number.                                 |
|                       | `ceil()`         | Round number up to nearest integer.                        |
|                       | `floor()`        | Round number down to nearest integer.                      |
| **Encoding/Decoding** | `jsonencode()`   | Convert a value into JSON string.                          |
|                       | `jsondecode()`   | Parse a JSON string into a Terraform value (map/list).     |
|                       | `base64encode()` | Encode string to Base64.                                   |
| **Filesystem**        | `file()`         | Read contents of a file.                                   |
|                       | `filebase64()`   | Read file and return Base64 string.                        |
|                       | `templatefile()` | Render a template file with variable substitutions.        |
| **Crypto / Hash**     | `sha256()`       | Return SHA256 hash of a string.                            |
|                       | `uuid()`         | Generate a random UUID.                                    |
| **IP/Network**        | `cidrsubnet()`   | Calculate subnet from a CIDR block.                        |
|                       | `cidrhost()`     | Get a specific host IP from a CIDR.                        |
| **Others**            | `timestamp()`    | Current UTC timestamp in RFC3339 format.                   |
|                       | `try()`          | Handle errors gracefully in expressions                    |
|                       | `can()`          | Returns true if expression evaluates without error         |

