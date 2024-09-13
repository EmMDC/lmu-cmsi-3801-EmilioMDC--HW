- **Homework 1 (Scripting)**: Lua, Python, JavaScript
- **Homework 2 (Enterprise)**: Java, Kotlin, Swift
- **Homework 3 (Theory)**: TypeScript, OCaml, Haskell
- **Homework 4 (Systems)**: C, C++, Rust
- **Homework 5 (Concurrency)**: Go

### Lua

```
This module contains utility functions and a class in Lua:

Functions
change(amount)
Purpose: Calculates the number of coins needed for a given amount using denominations of 25, 10, 5, and 1 cents.

Parameters:
amount (integer): The amount of money to be converted into coins.

Returns:
A table with the count of each denomination.

Errors:
Throws an error if amount is not an integer or is negative.

first_then_lower_case(list, predicate)
Purpose: Finds the first element in a list that satisfies a given predicate and returns it in lowercase.

Parameters:
list (table): A list of strings.
predicate (function): A function that takes a string and returns a boolean.

Returns:
The first element that satisfies the predicate, converted to lowercase, or nil if no such element is found.

powers_generator(base, limit)
Purpose: Generates powers of a given base up to a specified limit using coroutines.

Parameters:
base (number): The base for the powers.
limit (number): The upper limit for the generated powers.

Returns:
A coroutine that yields powers of the base up to the limit.

say(word)
Purpose: Creates a function that concatenates words when called.

Parameters:
word (string): The initial word to start with.

Returns:
A function that, when called with a new word, concatenates it with the previous word.

meaningful_line_count(filename)
Purpose: Counts the number of lines in a file that are not empty, not only whitespace, and do not start with a #.

Parameters:
filename (string): The path to the file to be processed.

Returns:
The count of meaningful lines in the file.

Errors:
Throws an error if the file cannot be opened.

Quaternion Class
The Quaternion class represents a quaternion with four components: a, b, c, and d. It provides various operations on quaternions. This language is able to perform the equivalent of the class through a table.

Methods
coefficients(): Returns the coefficients of the quaternion as a table {a, b, c, d}.
conjugate(): Returns the conjugate of the quaternion.
__add(other): Adds two quaternions.
__mul(other): Multiplies two quaternions.
__eq(other): Checks equality between two quaternions.
__tostring(): Returns a string representation of the quaternion.

Parameters:
a, b, c, d (number): The components of the quaternion.
```

### Python

```
This module contains utility functions and a data class for various operations:

Functions:


change(amount: int) -> dict[int, int]
Returns a dictionary representing the number of coins of each denomination needed to make up the given amount. Supported denominations are 25, 10, 5, and 1 cents.

Parameters:
amount: The total amount of money in cents.

Raises:
TypeError: If amount is not an integer.
ValueError: If amount is negative.


first_then_lower_case(list, predicate)
Returns the first element in the list that satisfies the predicate, converted to lowercase. If no element satisfies the predicate, returns None.

Parameters:
list: The list of elements to search through.
predicate: A function to test each element.


powers_generator(*, base, limit)
Generates powers of the specified base up to the given limit.

Parameters:
base: The base of the power.
limit: The upper limit for the powers.


say(word=None)
Creates a function that appends words to word when called. If word is not provided, returns an empty string.

Parameters:
word: The initial word or phrase.

Returns:
A function to concatenate words to word.


meaningful_line_count(filename)
Counts the number of lines in a file that are neither empty, made up of whitespace, nor start with a #.

Parameters:
filename: The name of the file to read.

Raises:
FileNotFoundError: If the file does not exist.

Data Class


Quaternion
Represents a quaternion with components a, b, c, and d.

Attributes:
a, b, c, d: The components of the quaternion.

Methods:
__str__(): Returns a string representation of the quaternion.
__eq__(other): Checks equality with another quaternion.
__mul__(other): Multiplies this quaternion with another quaternion.
__add__(other): Adds another quaternion to this one.

Properties:
coefficients: Returns the coefficients as a tuple (a, b, c, d).
conjugate: Returns the conjugate of the quaternion.
```

### JavaScript

```
npm test
```

### Java

```
javac *.java && java ExercisesTest
```

### Kotlin

```
kotlinc *.kt -include-runtime -d test.jar && java -jar test.jar
```

### Swift

```
swiftc -o main exercises.swift main.swift && ./main
```

### TypeScript

```
npm test
```

### OCaml

```
ocamlc exercises.ml exercises_test.ml && ./a.out
```

### Haskell

```
ghc ExercisesTest.hs && ./ExercisesTest
```

### C

```
gcc string_stack.c string_stack_test.c && ./a.out
```

### C++

```
g++ -std=c++20 stack_test.cpp && ./a.out
```

### Rust

```
cargo test
```

### Go

```
go run restaurant.go
```

## Grading Notes

Your grade is a reflection not only of your ability to write code to pass existing tests, but also of your ability to construct software in a professional setting. Therefore, the following will contribute rather heavily to your score:

- **Following all submission instructions**! Pay attention to every requirement such as replacing the contents of this readme file and including the names of all participants of any group work.
- **Keeping a pristine GitHub repository**. Do not push any file that does not belong (including but not limited to that silly `DS_Store`). Make sure all generated executables, intermediate files, third-party libraries, etc. are not committed. Your repo contents should be limited to your solution files, tests, configuration files, and `.gitignore` files.
- **Adherence to naming and formatting conventions for the language you are writing in**. Inconsistent indentation, for example, has no place in professional or student software. Neither does end-of-line whitespace, huge chunks of contiguous blank lines, and other types of messy coding practices that show friends, family, colleagues, and potential employers that you don’t care about your work.
- (As always) The **readability and maintainability** of your code.
