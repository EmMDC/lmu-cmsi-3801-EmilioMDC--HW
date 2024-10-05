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
Returns the first element in the list that satisfies the predicate, converted to lowercase. If no element satisfies the predicate, returns None. Makes sure to only accept positional arguuments.

Parameters:
list: The list of elements to search through.
predicate: A function to test each element.


powers_generator(*, base, limit)
Generates powers of the specified base up to the given limit. Makes sure to only accept keyword arguments.

Parameters:
base: The base of the power.
limit: The upper limit for the powers.


say(word=None)
Creates a function that appends words to word when called. If word is not provided, returns an empty string. Uses only a single defulat positoinal argument(word=None)

Parameters:
word: The initial word or phrase.

Returns:
A function to concatenate words to word.


meaningful_line_count(filename)
Counts the number of lines in a file that are neither empty, made up of whitespace, nor start with a #. Makes sure that the argument is positional only.

Parameters:
filename: The name of the file to read.

Raises:
FileNotFoundError: If the file does not exist.

Data Class


Quaternion
Represents a quaternion with components a, b, c, and d. Makes sure to make the class frozen to make it immutable.

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
This module provides several utility functions and a class for handling quaternions. The functionalities include:

Functions:


change(amount)
Calculates the number of coins required to make up a given amount.

Parameters:
amount (number): The amount of money.

Returns:
An object with counts of coins in denominations of 25, 10, 5, and 1.

Throws:
TypeError if the amount is not an integer.
RangeError if the amount is negative.

firstThenLowerCase(strings, predicate)
Finds the first string in an array that satisfies a predicate and converts it to lowercase. Uses the optional chaining operator provided by javascript.

Parameters:
strings (Array<string>): An array of strings.
predicate (function): A function to test each string.

Returns:
The first string that meets the predicate, converted to lowercase, or undefined if no string meets the predicate.

powersGenerator({ ofBase, upTo })
Generates powers of a base number up to a specified value. Uses destructuring of the object argument

Parameters:
ofBase (number): The base number.
upTo (number): The maximum value of the power.

Returns:
A generator that yields powers of the base number.

say(word = null)
Builds a phrase starting with the given word and appends additional words.

Parameters:
word (string|null): The starting word of the phrase.

Returns:
A function that appends words to the phrase.

meaningfulLineCount(filename)
Counts the number of meaningful lines in a file. Makes sure to complete this process through async functionality.

Parameters:
filename (string): The path to the file.

Returns:
The number of lines that are not empty, not made up of whitespace, and do not start with #.

Throws:
Error if the file does not exist.

Class
Quaternion
Represents a quaternion with four components: a, b, c, and d. Makes sure to use getters and make the objects frozen upon construction to make it immutable.

Constructor:
Quaternion(a, b, c, d): Initializes a quaternion with given components.

Methods:
toString(): Returns a string representation of the quaternion.
equals(other): Checks if this quaternion is equal to another quaternion.
times(other): Multiplies this quaternion by another quaternion and returns the result.
plus(other): Adds another quaternion to this quaternion and returns the result.

Getters:
coefficients: Returns an array of the quaternion's coefficients [a, b, c, d].
conjugate: Returns the conjugate of the quaternion.
```

### Java

```
This module provides utility functions and classes for handling various operations, including currency change calculation, joins arguments of succesive calls into strings, file accessing, quaternion class, and a binary search tree implementation.

### `change(long amount)`

Calculates the number of coins required to make up a given amount.

**Parameters:**
- `amount` (long): The amount of money.

**Returns:**
- A map with counts of coins in denominations of 25, 10, 5, and 1.

**Throws:**
- `IllegalArgumentException` if the amount is negative.

---

### `firstThenLowerCase(List<String> strings, Predicate<String> predicate)`

Finds the first string in a list that satisfies a given predicate and converts it to lowercase.

**Parameters:**
- `strings` (List<String>): A list of strings.
- `predicate` (Predicate<String>): A function to test each string.

**Returns:**
- An `Optional<String>` containing the first string that meets the predicate, converted to lowercase, or `Optional.empty()` if no string meets the predicate.

---

### `ChainablePhrase`

A class that allows for the creation of chainable phrases.

**Constructor:**
- `ChainablePhrase(String initialWord)`: Initializes a chainable phrase with the provided initial word.

### Methods

- `ChainablePhrase and(String word)`: Adds a word to the chain and returns a new instance to prevent shared state.
- `String phrase()`: Returns the accumulated phrase as a string.

### Static Methods

- `say()`: Initiates a chainable phrase with an empty string.
- `say(String word)`: Initiates a chainable phrase starting with the given word.

---

### `meaningfulLineCount(String filename)`

Counts the number of meaningful lines in a file.

**Parameters:**
- `filename` (String): The path to the file.

**Returns:**
- The number of lines that are not empty, not made up of whitespace, and do not start with `#`.

**Throws:**
- `IOException` if the file does not exist.

---

### `Quaternion`

Represents a quaternion with four components(vectors): `a`, `b`, `c`, and `d`. This class ensures the coefficients are valid and provides various mathematical operations as well as formats the string representation of a quaternion.

**Constructor:**
- `Quaternion(double a, double b, double c, double d)`: Initializes a quaternion with given components.

**Methods:**
- `Quaternion plus(Quaternion other)`: Adds another quaternion and returns the result.
- `Quaternion times(Quaternion other)`: Multiplies this quaternion by another and returns the result.
- `Quaternion conjugate()`: Returns the conjugate of the quaternion.
- `List<Double> coefficients()`: Returns a list of the quaternion's coefficients `[a, b, c, d]`.

**Constants:**
- `ZERO`, `I`, `J`, `K`: constants required for the tests.

---

### `BinarySearchTree`

A sealed interface representing a binary search tree.

**Methods:**
- `int size()`: Returns the number of nodes in the tree.
- `boolean contains(String value)`: Checks if the tree contains a specific value.
- `BinarySearchTree insert(String value)`: Inserts a value into the tree.

**Implementations:**
- `Empty`: Represents an empty tree.
- `Node`: Represents a node in the tree with a value

```

### Kotlin

```
This module provides utility functions and classes for handling various operations, including currency change calculation,  joins arguments of succesive calls into strings, file accessing, quaternion class, and a binary search tree implementation.

### `change(amount: Long): Map<Int, Long>`

Calculates the number of coins required to make up a given amount.

**Parameters:**
- `amount` (Long): The amount of money.

**Returns:**
- A map with counts of coins in denominations of 25, 10, 5, and 1.

**Throws:**
- `IllegalArgumentException` if the amount is negative.

---

### `firstThenLowerCase(strings: List<String>, predicate: (String) -> Boolean): String?`

Finds the first string in a list that satisfies a given predicate and converts it to lowercase.

**Parameters:**
- `strings` (List<String>): A list of strings.
- `predicate` ((String) -> Boolean): A function to test each string.

**Returns:**
- A nullable `String` containing the first string that meets the predicate, converted to lowercase, or `null` if no string meets the predicate.

---

### `meaningfulLineCount(filename: String): Long`

Counts the number of meaningful lines in a file.

**Parameters:**
- `filename` (String): The path to the file.

**Returns:**
- The number of lines that are not empty, not made up of whitespace, and do not start with `#`.

**Throws:**
- `IOException` if the file does not exist.

---

### `PhraseBuilder`

A class that allows for the creation of chainable phrases.

**Constructor:**
- `PhraseBuilder(wordList: List<String> = emptyList())`: Initializes a PhraseBuilder with the provided list of words or an empty list.

### Methods

- `fun and(newWord: String): PhraseBuilder`: Adds a word to the chain and returns a new `PhraseBuilder`.
- `val phrase: String`: A read-only property that gets the accumulated phrase as a string.
- `fun copy(): PhraseBuilder`: Creates a copy of the current `PhraseBuilder`.

### Top-Level Function

- `say(vararg initialWords: String): PhraseBuilder`: Initiates a new `PhraseBuilder` with the provided initial words.

---

### `Quaternion`

Represents a quaternion with four components: `a`, `b`, `c`, and `d`. This class ensures the coefficients are valid and provides various mathematical operations.

**Constructor:**
- `Quaternion(a: Double, b: Double, c: Double, d: Double)`: Initializes a quaternion with given components.

**Methods:**
- `operator fun plus(other: Quaternion): Quaternion`: Adds another quaternion and returns the result.
- `operator fun times(other: Quaternion): Quaternion`: Multiplies this quaternion by another and returns the result.
- `fun coefficients(): List<Double>`: Returns a list of the quaternion's coefficients `[a, b, c, d]`.
- `fun conjugate(): Quaternion`: Returns the conjugate of the quaternion.
- `override fun toString(): String`: Returns a string representation of the quaternion.

**Companion Object Constants:**
- `ZERO`, `I`, `J`, `K`: constants needed for test.

---

### Binary Search Tree

A sealed interface representing a binary search tree.

### Methods

- `fun size(): Int`: Returns the number of nodes in the tree.
- `fun contains(value: String): Boolean`: Checks if the tree contains a specific value.
- `fun insert(value: String): BinarySearchTree`: Inserts a value into the tree.

### Implementations

- `object Empty`: Represents an empty tree.
- `data class Node`: Represents a node in the tree with a value, left, and right children.

```

### Swift

```

This module provides utility functions and classes for handling various operations, including currency change calculation,  joins arguments of succesive calls into strings, file accessing, quaternion class, and a binary search tree implementation.

## Functions

### `change(_ amount: Int) -> Result<[Int: Int], NegativeAmountError>`

Calculates the number of coins required to make up a given amount.

**Parameters:**
- `amount` (Int): The amount of money.

**Returns:**
- A `Result` containing a dictionary with counts of coins in denominations of 25, 10, 5, and 1, or a failure with `NegativeAmountError` if the amount is negative.

---

### `firstThenLowerCase(of strings: [String], satisfying predicate: (String) -> Bool) -> String?`

Finds the first string in an array that satisfies a given predicate and converts it to lowercase.

**Parameters:**
- `strings` ([String]): An array of strings.
- `predicate` ((String) -> Bool): A closure that tests each string.

**Returns:**
- An optional `String` containing the first string that meets the predicate, converted to lowercase, or `nil` if no string meets the predicate.

---

### `struct sayer`

A structure that allows the creation of chainable phrases.

**Properties:**
- `wordsList` ([String]): The list of words that make up the phrase.

**Initializer:**
- `init(_ word: String = "")`: Initializes a `sayer` with the provided word.

### Methods

- `func and(_ word: String) -> sayer`: Adds a word to the phrase and returns a new instance.
- `var phrase: String`: Returns the accumulated phrase as a string.

### Static Methods

- `func say(_ word: String = "") -> sayer`: Initiates a `sayer` with an optional initial word.

---

### `Quaternion`

Represents a quaternion with four components (a, b, c, and d) and provides various mathematical operations as well as a string representation.

**Properties:**
- `a`, `b`, `c`, `d` (Double): The components of the quaternion.

**Constants:**
- `static let ZERO`, `static let I`, `static let J`, `static let K`: Constants representing specific quaternions.

**Initializer:**
- `init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0)`: Initializes a quaternion with the specified components.

### Methods

- `var coefficients: [Double]`: Returns the quaternion's coefficients as an array.
- `var conjugate: Quaternion`: Returns the conjugate of the quaternion.
- `static func + (lhs: Quaternion, rhs: Quaternion) -> Quaternion`: Adds two quaternions.
- `static func * (lhs: Quaternion, rhs: Quaternion) -> Quaternion`: Multiplies two quaternions.
- `var description: String`: Provides a string representation of the quaternion.

---

### BinarySearchTree

An enumeration representing a binary search tree.

**Cases:**
- `case empty`: Represents an empty tree.
- `indirect case node(BinarySearchTree, String, BinarySearchTree)`: Represents a node in the tree with a value and left/right subtrees.

### Methods

- `var size: Int`: Returns the number of nodes in the tree.
- `func contains(_ value: String) -> Bool`: Checks if the tree contains a specific value.
- `func insert(_ value: String) -> BinarySearchTree`: Inserts a value into the tree.
- `var description: String`: Provides a string representation of the tree structure.

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
