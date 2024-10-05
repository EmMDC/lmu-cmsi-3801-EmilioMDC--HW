import Foundation

struct NegativeAmountError: Error {}
struct NoSuchFileError: Error {}

func change(_ amount: Int) -> Result<[Int:Int], NegativeAmountError> {
    if amount < 0 {
        return .failure(NegativeAmountError())
    }
    var (counts, remaining) = ([Int:Int](), amount)
    for denomination in [25, 10, 5, 1] {
        (counts[denomination], remaining) = 
            remaining.quotientAndRemainder(dividingBy: denomination)
    }
    return .success(counts)
}

//Problem 1
func firstThenLowerCase(of strings: [String], satisfying predicate: (String) -> Bool) -> String? {
    return strings.first(where: predicate)?.lowercased()
}

// Problem 2
struct sayer {
    private var wordsList: [String]

    init(_ word: String = "") {
        self.wordsList = [word]
    }

    func and(_ word: String) -> sayer {
        var newWords = wordsList
        newWords.append(word)
        return sayer(newWords.joined(separator: " "))
    }

    var phrase: String {
        return wordsList.joined(separator: " ")
    }
}

func say(_ word: String = "") -> sayer {
    return sayer(word)
}

// Problem 4 - Used Homework Helper 2 as reference
struct Quaternion: CustomStringConvertible, Equatable {
    let a, b, c, d: Double

    static let ZERO = Quaternion(a: 0, b: 0, c: 0, d: 0)
    static let I = Quaternion(a: 0, b: 1, c: 0, d: 0)
    static let J = Quaternion(a: 0, b: 0, c: 1, d: 0)
    static let K = Quaternion(a: 0, b: 0, c: 0, d: 1)

    init(a: Double = 0, b: Double = 0, c: Double = 0, d: Double = 0) {
        self.a = a
        self.b = b
        self.c = c
        self.d = d
    }

    var coefficients: [Double] {
        return [a, b, c, d]
    }

    var conjugate: Quaternion {
        return Quaternion(a: a, b: -b, c: -c, d: -d)
    }

    static func +(lhs: Quaternion, rhs: Quaternion) ->  Quaternion{
        return Quaternion(a: lhs.a + rhs.a, b: lhs.b + rhs.b, c: lhs.c + rhs.c, d: lhs.d + rhs.d)
    }

    static func *(lhs: Quaternion, rhs: Quaternion) -> Quaternion {
        return Quaternion(
            a: lhs.a * rhs.a - lhs.b * rhs.b - lhs.c * rhs.c - lhs.d * rhs.d,
            b: lhs.a * rhs.b + lhs.b * rhs.a + lhs.c * rhs.d - lhs.d * rhs.c,
            c: lhs.a * rhs.c - lhs.b * rhs.d + lhs.c * rhs.a + lhs.d * rhs.b,
            d: lhs.a * rhs.d + lhs.b * rhs.c - lhs.c * rhs.b + lhs.d * rhs.a
        )
    }   
    
    var description: String {
        func formatTerm(value: Double, unit: String) -> String {
            switch value {
            case 0.0:
                return ""
            case 1.0:
                return unit
            case -1.0:
                return "-\(unit)"
            default:
                return "\(value)\(unit)"
            }
        }

        var stringRep = [String]()
        if a != 0.0 {
            stringRep.append("\(a)")
        }
        stringRep.append(formatTerm(value: b, unit: "i"))
        stringRep.append(formatTerm(value: c, unit: "j"))
        stringRep.append(formatTerm(value: d, unit: "k"))
        let filteredStringRep = stringRep.filter { !$0.isEmpty }
        if filteredStringRep.isEmpty {
            return "0"
        }
        let result = filteredStringRep.joined(separator: "+").replacingOccurrences(of: "+-", with: "-")
        return result
    }
}
// Problem 5 - Used Homework Helper 2 as reference

enum BinarySearchTree: CustomStringConvertible {
    case empty
    indirect case node(BinarySearchTree, String, BinarySearchTree)

    var size: Int{
        switch self {
        case .empty:
            return 0
        case let .node(left, _, right):
            return 1 + left.size + right.size
        }
    }

    func contains(_ value: String) -> Bool {
        switch self {
        case .empty:
            return false
        case let .node(left, v, right):
            if value < v {
                return left.contains(value)
            } else if value > v {
                return right.contains(value)
            } else {
                return true 
            }
        }
    }

    func insert(_ value: String) -> BinarySearchTree {
        switch self {
        case .empty:
            return .node(.empty, value, .empty)
        case let .node(left, v, right):
            if value < v {
                return .node(left.insert(value), v, right)
            } else if value > v {
                return .node(left, v, right.insert(value))
            } else {
                return self
            }
        }  
    }
    var description: String {
        switch self {
        case .empty:
            return "()"
        case let .node(left, value, right):
            var ans = ""

            if case .empty = left {
            } else {
                ans += left.description
            }

            ans += "\(value)"

            if case .empty = right {

            } else {
                ans += right.description
            }

            return "(\(ans))"
        }
    }
}