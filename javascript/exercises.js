import { open } from "node:fs/promises"
import { createInterface } from "node:readline"

export function change(amount) {
  if (!Number.isInteger(amount)) {
    throw new TypeError("Amount must be an integer")
  }
  if (amount < 0) {
    throw new RangeError("Amount cannot be negative")
  }
  let [counts, remaining] = [{}, amount]
  for (const denomination of [25, 10, 5, 1]) {
    counts[denomination] = Math.floor(remaining / denomination)
    remaining %= denomination
  }
  return counts
}

//used helper video as reference
export function firstThenLowerCase(strings, predicate) {
  const first = strings.find(predicate)
  return first?.toLowerCase()
}

export function* powersGenerator({ ofBase, upTo }) {
  let exponent = 0
  let value = ofBase ** exponent
  while (value <= upTo) {
    yield value
    exponent += 1
    value = ofBase ** exponent
  }
}

export function say(word = null) {
  if (word === null) {
    return ""
  }

  function nextWord(next = null) {
    if (next === null) {
      return word
    } else {
      return say(`${word} ${next}`)
    }
  }
  return nextWord
}

export async function meaningfulLineCount(filename) {
  try {
    let validLines = 0
    const file = await open(filename, "r")
    const fileStream = file.createReadStream()

    for await (const chunk of fileStream) {
      const lines = chunk.toString("utf-8").split("\n")
      for (let line of lines) {
        const strippedLine = line.trim()
        if (strippedLine && !strippedLine.startsWith("#")) {
          validLines++
        }
      }
    }

    await file.close()
    return validLines
  } catch (err) {
    throw new Error(`No such file: ${filename}`)
  }
}

//   let validLines = 0
//   let fileHandle

//   try {
//     fileHandle = await open(filename, "r")
//     const rl = createInterface({
//       input: fileHandle.createReadStream(),
//       crlfDelay: Infinity,
//     })

//     for await (const line of rl) {
//       const strippedLine = line.trim()
//       if (strippedLine !== "" && strippedLine.charAt(0) !== "#") {
//         validLines++
//       }
//     }
//   } catch (err) {
//     throw new Error(`No such file: ${filename}`)
//   } finally {
//     if (fileHandle) {
//       await fileHandle.close()
//     }
//   }
//   return validLines
// }

export class Quaternion {
  constructor(a, b, c, d) {
    this.a = a
    this.b = b
    this.c = c
    this.d = d
    Object.freeze(this)
  }

  toString() {
    let stringRep = []

    if (this.a !== 0) {
      stringRep.push(String(this.a))
    }
    if (this.b !== 0) {
      if (this.b === 1) {
        stringRep.push("i")
      } else if (this.b === -1) {
        stringRep.push("-i")
      } else {
        stringRep.push(`${this.b}i`)
      }
    }
    if (this.c !== 0) {
      if (this.c === 1) {
        stringRep.push("j")
      } else if (this.c === -1) {
        stringRep.push("-j")
      } else {
        stringRep.push(`${this.c}j`)
      }
    }
    if (this.d !== 0) {
      if (this.d === 1) {
        stringRep.push("k")
      } else if (this.d === -1) {
        stringRep.push("-k")
      } else {
        stringRep.push(`${this.d}k`)
      }
    }

    if (stringRep.length === 0) {
      return "0"
    }

    let ans = stringRep.join("+")

    //needs to occur multiple times other replace stopped at the first instance
    //set to 3 as that is the max it will ever be with quaternion having 4 parameters
    for (let i = 0; i < 3; i++) {
      ans = ans.replace("+-", "-")
    }
    return ans
  }

  equals(other) {
    return (
      this.a === other.a &&
      this.b === other.b &&
      this.c === other.c &&
      this.d === other.d
    )
  }

  times(other) {
    return new Quaternion(
      this.a * other.a - this.b * other.b - this.c * other.c - this.d * other.d,
      this.a * other.b + this.b * other.a + this.c * other.d - this.d * other.c,
      this.a * other.c - this.b * other.d + this.c * other.a + this.d * other.b,
      this.a * other.d + this.b * other.c - this.c * other.b + this.d * other.a
    )
  }

  plus(other) {
    return new Quaternion(
      this.a + other.a,
      this.b + other.b,
      this.c + other.c,
      this.d + other.d
    )
  }

  get coefficients() {
    return [this.a, this.b, this.c, this.d]
  }

  get conjugate() {
    return new Quaternion(this.a, -this.b, -this.c, -this.d)
  }
}
