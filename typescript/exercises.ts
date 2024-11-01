import { open } from "node:fs/promises"

export function change(amount: bigint): Map<bigint, bigint> {
  if (amount < 0) {
    throw new RangeError("Amount cannot be negative")
  }
  let counts: Map<bigint, bigint> = new Map()
  let remaining = amount
  for (const denomination of [25n, 10n, 5n, 1n]) {
    counts.set(denomination, remaining / denomination)
    remaining %= denomination
  }
  return counts
}

// Problem 1: First Applied
export function firstThenApply<T, U>(
  items: T[],
  predicate: (item: T) => boolean,
  transform: (item: T) => U
): U | undefined {
  const firstItem = items.find(predicate)
  return firstItem !== undefined ? transform(firstItem) : undefined
}

// Problem 2: Powers Generator
export function* powersGenerator(base: bigint): Generator<bigint> {
  for (let powerValue = 1n; ; powerValue *= base) {
    yield powerValue
  }
}

// Problem 3: Line Count
export async function meaningfulLineCount(filename: string): Promise<number> {
  let validLineCount = 0
  const fileHandle = await open(filename, "r")

  try {
    for await (const line of fileHandle.readLines()) {
      const strippedLine = line.trim()
      if (strippedLine && !strippedLine.startsWith("#")) {
        validLineCount++
      }
    }
  } catch (err) {
    throw new Error(`No such file: ${filename}`)
  } finally {
    await fileHandle.close()
  }
  return validLineCount
}

// Problem 4: Shapes Surface Area/Volume
interface Sphere {
  readonly kind: "Sphere"
  readonly radius: number
}

interface Box {
  readonly kind: "Box"
  readonly width: number
  readonly length: number
  readonly depth: number
}

export type Shape = Sphere | Box

export function surfaceArea(shape: Shape): number {
  switch (shape.kind) {
    case "Sphere":
      return 4 * Math.PI * shape.radius ** 2
    case "Box":
      return (
        2 *
        (shape.length * shape.width +
          shape.width * shape.depth +
          shape.depth * shape.length)
      )
  }
}

export function volume(shape: Shape): number {
  switch (shape.kind) {
    case "Sphere":
      return (4 / 3) * Math.PI * shape.radius ** 3
    case "Box":
      return shape.length * shape.width * shape.depth
  }
}

// Problem 5: Binary Search Tree
export interface BinarySearchTree<T> {
  size(): number
  insert(value: T): BinarySearchTree<T>
  contains(value: T): boolean
  inorder(): Iterable<T>
}

export interface Comparable<T> {
  compareTo(other: T): number
}

export class Empty<T> implements BinarySearchTree<T> {
  size(): number {
    return 0
  }

  contains(value: T): boolean {
    return false
  }

  insert(value: T): BinarySearchTree<T> {
    return new Node(value, new Empty<T>(), new Empty<T>())
  }

  *inorder(): Iterable<T> {
    return
  }

  toString(): string {
    return "()"
  }
}

export class Node<T> implements BinarySearchTree<T> {
  constructor(
    private nodeValue: T,
    private leftChild: BinarySearchTree<T>,
    private rightChild: BinarySearchTree<T>
  ) {}

  size(): number {
    return 1 + this.leftChild.size() + this.rightChild.size()
  }

  contains(value: T): boolean {
    if (value < this.nodeValue) {
      return this.leftChild.contains(value)
    } else if (value > this.nodeValue) {
      return this.rightChild.contains(value)
    } else {
      return true
    }
  }

  insert(value: T): BinarySearchTree<T> {
    if (value < this.nodeValue) {
      return new Node(
        this.nodeValue,
        this.leftChild.insert(value),
        this.rightChild
      )
    } else if (value > this.nodeValue) {
      return new Node(
        this.nodeValue,
        this.leftChild,
        this.rightChild.insert(value)
      )
    } else {
      return this
    }
  }

  *inorder(): Iterable<T> {
    yield* this.leftChild.inorder()
    yield this.nodeValue
    yield* this.rightChild.inorder()
  }

  toString(): string {
    const nodeStrings: string[] = []
    if (!(this.leftChild instanceof Empty)) {
      nodeStrings.push(this.leftChild.toString())
    }
    nodeStrings.push(String(this.nodeValue))
    if (!(this.rightChild instanceof Empty)) {
      nodeStrings.push(this.rightChild.toString())
    }
    return `(${nodeStrings.join("")})`
  }
}
