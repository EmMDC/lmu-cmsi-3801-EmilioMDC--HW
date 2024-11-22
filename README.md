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
This module provides utility functions and classes for handling various operations, including finding elements in arrays, generating powers of numbers, counting lines in files, calculating geometric properties, and implementing a binary search tree.

## Functions

### `firstThenApply<T, U>(items: T[], predicate: (item: T) => boolean, transform: (item: T) => U): U | undefined`

Finds the first item in an array that satisfies a given predicate and applies a transformation function to it.

**Parameters:**
- `items` (T[]): An array of items.
- `predicate` ((item: T) => boolean): A function that tests each item in the array.
- `transform` ((item: T) => U): A function that transforms the first matching item.

**Returns:**
- An optional transformed item of type `U`, or `undefined` if no match is found.

---

### `powersGenerator(base: bigint): Generator<bigint>`

Generates successive powers of a given base.

**Parameters:**
- `base` (bigint): The base number.

**Yields:**
- A sequence of `bigint` values, each representing the next power of the base, starting from 1.

---

### `meaningfulLineCount(filename: string): Promise<number>`

Counts the number of non-empty, non-comment lines in a file.

**Parameters:**
- `filename` (string): The name of the file to read.

**Returns:**
- A `Promise` resolving to the number of meaningful lines.

**Throws:**
- An error if the file cannot be opened or found.

---

## Types and Interfaces

### `interface Sphere`

Represents a sphere with a specific radius.

**Properties:**
- `kind` ("Sphere"): Identifies the shape as a sphere.
- `radius` (number): The radius of the sphere.

---

### `interface Box`

Represents a box with specified dimensions.

**Properties:**
- `kind` ("Box"): Identifies the shape as a box.
- `width` (number): The width of the box.
- `length` (number): The length of the box.
- `depth` (number): The depth of the box.

---

## Geometry Functions

### `surfaceArea(shape: Shape): number`

Calculates the surface area of a given shape.

**Parameters:**
- `shape` (Shape): A `Sphere` or `Box` object.

**Returns:**
- The surface area of the shape.

---

### `volume(shape: Shape): number`

Calculates the volume of a given shape.

**Parameters:**
- `shape` (Shape): A `Sphere` or `Box` object.

**Returns:**
- The volume of the shape.

---

## Binary Search Tree

### `interface BinarySearchTree<T>`

An interface defining the structure of a binary search tree.

**Methods:**
- `size(): number`: Returns the number of nodes in the tree.
- `contains(value: T): boolean`: Checks if the tree contains a specific value.
- `insert(value: T): BinarySearchTree<T>`: Inserts a value into the tree.
- `inorder(): Iterable<T>`: Provides an in-order traversal of the tree.

### `class Empty<T>`

Represents an empty node in a binary search tree.

**Methods:**
- `size()`: Returns `0`.
- `contains(value: T)`: Returns `false`.
- `insert(value: T)`: Inserts a new node.
- `inorder()`: Returns an empty iterator.

### `class Node<T>`

Represents a non-empty node in a binary search tree, with left and right children.

**Properties:**
- `nodeValue` (T): The value of the node.
- `leftChild` (BinarySearchTree<T>): The left subtree.
- `rightChild` (BinarySearchTree<T>): The right subtree.

**Methods:**
- `size()`: Returns the size of the tree.
- `contains(value: T)`: Checks if the tree contains a specific value.
- `insert(value: T)`: Inserts a value into the tree.
- `inorder()`: Provides an in-order traversal of the tree.
npm test

```

### OCaml

```

This module provides utility functions and types for operations like calculating currency denominations, finding elements in arrays, generating powers, counting lines in files, computing geometric properties, and implementing a binary search tree.

## Functions

### `first_then_apply : 'a list -> ('a -> bool) -> ('a -> 'b) -> 'b option`

Finds the first element in a list that satisfies a given predicate and applies a consumer function to it.

**Parameters:**
- `array` ('a list): A list of elements.
- `predicate` ('a -> bool): A function to test each element.
- `consumer` ('a -> 'b): A function applied to the first matching element.

**Returns:**
- An optional value of type `'b` after applying `consumer`, or `None` if no match is found.

---

### `powers_generator : int -> int Seq.t`

Generates successive powers of a given base.

**Parameters:**
- `base` (int): The base number.

**Returns:**
- A sequence of integers representing powers of the base, starting from 1.

---

### `meaningful_line_count : string -> int`

Counts the number of non-empty, non-comment lines in a file.

**Parameters:**
- `filename` (string): The name of the file to read.

**Returns:**
- An integer representing the count of meaningful lines.

**Exceptions:**
- Throws an error if the file cannot be opened.

---

## Types and Interfaces

### `type shape`

Defines different shapes for calculating volume and surface area.

- `Sphere of float`: Represents a sphere with a specified radius.
- `Box of float * float * float`: Represents a box with specified dimensions.

---

## Geometry Functions

### `volume : shape -> float`

Calculates the volume of a given shape.

**Parameters:**
- `shape_item` (shape): A `Sphere` or `Box`.

**Returns:**
- The volume of the shape as a float.

---

### `surface_area : shape -> float`

Calculates the surface area of a given shape.

**Parameters:**
- `shape_item` (shape): A `Sphere` or `Box`.

**Returns:**
- The surface area of the shape as a float.

---

## Binary Search Tree

### `type 'a binary_search_tree`

A type representing a binary search tree structure.

- `Empty`: Represents an empty tree.
- `Node of 'a binary_search_tree * 'a * 'a binary_search_tree`: Represents a node with a value and left/right subtrees.

---

### Binary Search Tree Functions

#### `size : 'a binary_search_tree -> int`

Calculates the number of nodes in the tree.

**Parameters:**
- `tree` ('a binary_search_tree): The binary search tree.

**Returns:**
- An integer representing the number of nodes in the tree.

---

#### `insert : 'a -> 'a binary_search_tree -> 'a binary_search_tree`

Inserts a value into the binary search tree.

**Parameters:**
- `value` ('a): The value to insert.
- `tree` ('a binary_search_tree): The tree to insert the value into.

**Returns:**
- A new binary search tree with the value inserted.

---

#### `contains : 'a -> 'a binary_search_tree -> bool`

Checks if the tree contains a specific value.

**Parameters:**
- `value` ('a): The value to search for.
- `tree` ('a binary_search_tree): The tree to search in.

**Returns:**
- `true` if the value is in the tree, `false` otherwise.

---

#### `inorder : 'a binary_search_tree -> 'a list`

Performs an in-order traversal of the tree.

**Parameters:**
- `tree` ('a binary_search_tree): The tree to traverse.

**Returns:**
- A list of elements in in-order sequence.

ocamlc exercises.ml exercises_test.ml && ./a.out
```

### Haskell

```

This module provides a set of utility functions and data types for handling currency change, processing lists, generating powers, counting lines in files, calculating geometric properties, and implementing a binary search tree.

## Functions

### `firstThenApply :: [a] -> (a -> Bool) -> (a -> b) -> Maybe b`

Finds the first element in a list that satisfies a given predicate and applies a function to it.

**Parameters:**
- `elements` ([a]): A list of elements.
- `predicate` (a -> Bool): A function to test each element.
- `function` (a -> b): A function applied to the first matching element.

**Returns:**
- A `Maybe b` value, which is `Just (function matchedElement)` or `Nothing` if no match is found.

---

### `powers :: (Integral a) => a -> [a]`

Generates a list of powers of a given base.

**Parameters:**
- `base` (a): The base number.

**Returns:**
- A list of integers representing the powers of the base, starting from \( base^0 \).

---

### `meaningfulLineCount :: FilePath -> IO Int`

Counts the number of non-empty, non-comment lines in a specified file.

**Parameters:**
- `filePath` (FilePath): The path of the file to read.

**Returns:**
- An `IO Int` representing the count of meaningful lines.

---

## Data Types

### `data Shape`

Defines different shapes for calculating volume and surface area.

- `Sphere Double`: Represents a sphere with a specified radius.
- `Box Double Double Double`: Represents a box with specified length, width, and height.

---

## Geometry Functions

### `volume :: Shape -> Double`

Calculates the volume of a given shape.

**Parameters:**
- `shape` (Shape): A `Sphere` or `Box`.

**Returns:**
- The volume of the shape as a `Double`.

---

### `surfaceArea :: Shape -> Double`

Calculates the surface area of a given shape.

**Parameters:**
- `shape` (Shape): A `Sphere` or `Box`.

**Returns:**
- The surface area of the shape as a `Double`.

---

## Binary Search Tree

### `data BST value`

A type representing a binary search tree structure.

- `Empty`: Represents an empty tree.
- `Node value (BST value) (BST value)`: Represents a node containing a value and its left and right subtrees.

---

### Binary Search Tree Functions

#### `size :: BST value -> Int`

Calculates the number of nodes in the tree.

**Parameters:**
- `tree` (BST value): The binary search tree.

**Returns:**
- An integer representing the number of nodes in the tree.

---

#### `insert :: Ord value => value -> BST value -> BST value`

Inserts a value into the binary search tree.

**Parameters:**
- `newValue` (Ord value): The value to insert.
- `tree` (BST value): The tree to insert the value into.

**Returns:**
- A new binary search tree with the value inserted.

---

#### `contains :: Ord value => value -> BST value -> Bool`

Checks if the tree contains a specific value.

**Parameters:**
- `searchValue` (Ord value): The value to search for.
- `tree` (BST value): The tree to search in.

**Returns:**
- `True` if the value is in the tree, `False` otherwise.

---

#### `inorder :: BST value -> [value]`

Performs an in-order traversal of the tree.

**Parameters:**
- `tree` (BST value): The tree to traverse.

**Returns:**
- A list of elements in in-order sequence.

---

## Show Instance for BST

### `instance Show value => Show (BST value)`

Defines how to display a binary search tree as a string.

**Returns:**
- An empty string for `Empty`.
- A string representation of the tree structure for `Node`.

ghc ExercisesTest.hs && ./ExercisesTest
```

### C

```

This module provides a dynamic stack implementation for managing strings. The stack grows and shrinks automatically as elements are pushed and popped. It includes basic stack operations like push, pop, and checking if the stack is empty or full.

## Functions

### `create :: IO (stack_response)`

Creates a new stack with an initial capacity of 16.

**Returns:**
- `out_of_memory` if memory allocation fails.
- `success` with the created stack if successful.

---

### `size :: stack -> Int`

Returns the number of elements in the stack.

---

### `is_empty :: stack -> Bool`

Checks if the stack is empty.

---

### `is_full :: stack -> Bool`

Checks if the stack is full.

---

### `push :: stack -> String -> response_code`

Pushes a string onto the stack.

**Returns:**
- `stack_full` if the stack is full.
- `stack_element_too_large` if the string exceeds the maximum size.
- `out_of_memory` if memory allocation fails.
- `success` if successful.

---

### `pop :: stack -> string_response`

Pops the top element from the stack and returns it.

**Returns:**
- `stack_empty` if the stack is empty.
- `out_of_memory` if memory allocation fails during resizing.
- `success` with the popped string.

---

### `destroy :: stack -> IO ()`

Destroys the stack and frees memory.

gcc string_stack.c string_stack_test.c && ./a.out
```

### C++

```
This module provides a dynamic stack implementation in C++ using a templated class. The stack automatically grows and shrinks as elements are pushed and popped, with a maximum capacity of 32,768 elements. It includes basic stack operations like push, pop, and checks for whether the stack is empty or full.

## Methods

### `Stack()`

Constructor that creates a stack with an initial capacity of 16.

---

### `size() const -> int`

Returns the number of elements currently in the stack.

---

### `is_empty() const -> bool`

Checks if the stack is empty.

**Returns:**
- `true` if the stack is empty.
- `false` otherwise.

---

### `is_full() const -> bool`

Checks if the stack is full.

**Returns:**
- `true` if the stack is full.
- `false` otherwise.

---

### `push(T item)`

Pushes an element onto the stack.

**Parameters:**
- `item`: The item to be pushed onto the stack.

**Throws:**
- `overflow_error` if the stack has reached its maximum capacity (32,768).

---

### `pop() -> T`

Pops the top element from the stack.

**Returns:**
- The popped element.

**Throws:**
- `underflow_error` if attempting to pop from an empty stack.

g++ -std=c++20 stack_test.cpp && ./a.out
```

### Rust

```
This module provides a generic stack implementation in Rust. The stack grows automatically as elements are pushed and popped, using a `Vec` to store the elements. It includes basic stack operations such as `push`, `pop`, `peek`, checking if the stack is empty, and getting the stack's length.

## Methods

### `new() -> Stack<T>`

Creates a new empty stack.

---

### `push(&mut self, item: T)`

Pushes an element onto the stack.

**Parameters:**
- `item`: The item to be pushed onto the stack.

---

### `pop(&mut self) -> Option<T>`

Pops the top element from the stack.

**Returns:**
- `Some(item)` if an element is popped.
- `None` if the stack is empty.

---

### `peek(&self) -> Option<&T>`

Peeks at the top element without removing it.

**Returns:**
- `Some(&item)` if the stack is not empty.
- `None` if the stack is empty.

---

### `is_empty(&self) -> bool`

Checks if the stack is empty.

**Returns:**
- `true` if the stack is empty.
- `false` otherwise.

---

### `len(&self) -> usize`

Returns the number of elements in the stack.

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
