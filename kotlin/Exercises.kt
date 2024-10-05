import java.io.BufferedReader
import java.io.FileReader
import java.io.IOException

fun change(amount: Long): Map<Int, Long> {
    require(amount >= 0) { "Amount cannot be negative" }
    
    val counts = mutableMapOf<Int, Long>()
    var remaining = amount
    for (denomination in listOf(25, 10, 5, 1)) {
        counts[denomination] = remaining / denomination
        remaining %= denomination
    }
    return counts
}

// Problem 1
fun firstThenLowerCase(strings: List<String>, predicate: (String) -> Boolean): String? {
    val firstElement = strings.firstOrNull(predicate)
    return firstElement?.lowercase()
}

// Problem 2
class PhraseBuilder(private val wordList: List<String> = emptyList()) {

    fun and(newWord: String): PhraseBuilder {
        return PhraseBuilder(wordList + newWord)
    }

    val phrase: String
        get() = wordList.joinToString(" ")

    fun copy(): PhraseBuilder {
        return PhraseBuilder(wordList.toList()) 
    }
}

// Top-level function to create a new PhraseBuilder
fun say(vararg initialWords: String): PhraseBuilder {
    return PhraseBuilder(initialWords.toList())
}

// Problem 3
@Throws(IOException::class)
fun meaningfulLineCount(filename: String): Long {
    BufferedReader(FileReader(filename)).use { reader ->
        return reader.lines()
            .filter { line -> line.trim().isNotEmpty() && !line.trim().startsWith("#") }
            .count()
    }
}

// Problem 4 - Used Homework Helper 2 as reference
data class Quaternion(val a: Double, val b: Double, val c: Double, val d: Double) {

    companion object {
        val ZERO = Quaternion(0.0, 0.0, 0.0, 0.0)
        val I = Quaternion(0.0, 1.0, 0.0, 0.0)
        val J = Quaternion(0.0, 0.0, 1.0, 0.0)
        val K = Quaternion(0.0, 0.0, 0.0, 1.0)
    }
    operator fun plus(other: Quaternion): Quaternion {
        return Quaternion(a + other.a, b + other.b, c + other.c, d + other.d)
    }

    operator fun times(other: Quaternion): Quaternion {
        return Quaternion(
            a * other.a - b * other.b - c * other.c - d * other.d,
            a * other.b + b * other.a + c * other.d - d * other.c,
            a * other.c - b * other.d + c * other.a + d * other.b,
            a * other.d + b * other.c - c * other.b + d * other.a)
    }

    fun coefficients(): List<Double> = listOf(a, b, c, d)

    fun conjugate(): Quaternion = Quaternion(a, -b, -c, -d)

    override fun toString(): String = formatQuaternion()

    private fun formatQuaternion(): String {
        fun formatTerm(value: Double, unit: String): String {
            return when {
                value == 0.0 -> ""
                value == 1.0 -> unit
                value == -1.0 -> "-$unit"
                else -> "$value$unit"
            }
        }

        val stringRep = mutableListOf<String>()

        if (a != 0.0) {
            stringRep.add(a.toString())
        }
        stringRep.add(formatTerm(b, "i"))
        stringRep.add(formatTerm(c, "j"))
        stringRep.add(formatTerm(d, "k"))

        val filteredStringRep = stringRep.filter { it.isNotEmpty() }

        if (filteredStringRep.isEmpty()) {
            return "0"
        }

        // Join the string parts and replace "+-" with "-"
        val result = filteredStringRep.joinToString("+").replace("+-", "-")
        return result
    }
    
}

// Problem 5 - Used Homework Helper 2 as reference
sealed interface BinarySearchTree {
    fun size(): Int
    fun contains(value: String): Boolean
    fun insert(value: String): BinarySearchTree

    object Empty : BinarySearchTree {
        override fun size(): Int = 0
        override fun contains(value: String): Boolean = false
        override fun insert(value: String): BinarySearchTree = Node(value, Empty, Empty)
        override fun toString(): String = "()"
    }

    data class Node(private val value: String, private val left: BinarySearchTree, private val right: BinarySearchTree): BinarySearchTree {
        override fun size(): Int = 1 + left.size() + right.size()
        override fun contains(value: String): Boolean = when {
            value < this.value -> left.contains(value)
            value > this.value -> right.contains(value)
            else -> true 
        }
        override fun insert(value: String): BinarySearchTree = when {
            value < this.value -> Node(this.value, left.insert(value), right)
            value > this.value -> Node(this.value, left, right.insert(value))
            else -> this
        }
        override fun toString(): String {
            val ans = StringBuilder()
            if (left !is Empty) {
                ans.append(left)
            }
            ans.append(value)
            if (right !is Empty) {
                ans.append(right)
            }
            return "($ans)"
        }
    }
}
