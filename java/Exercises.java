import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.Optional;
import java.util.function.Predicate;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.FileNotFoundException;
import java.util.ArrayList;


public class Exercises {
    static Map<Integer, Long> change(long amount) {
        if (amount < 0) {
            throw new IllegalArgumentException("Amount cannot be negative");
        }
        var counts = new HashMap<Integer, Long>();
        for (var denomination : List.of(25, 10, 5, 1)) {
            counts.put(denomination, amount / denomination);
            amount %= denomination;
        }
        return counts;
    }

    // Problem 1
    static Optional<String> firstThenLowerCase(List<String> strings, Predicate<String> predicate) {
        return strings.stream()
                .filter(predicate)
                .map(String::toLowerCase)
                .findFirst();
    }
    
    // Problem 2
    static class ChainablePhrase {
        private final StringBuilder phrase;

        public ChainablePhrase(String initialWord) {
            this.phrase = new StringBuilder(initialWord);
        }

        public ChainablePhrase and(String word) {
            ChainablePhrase newPhrase = new ChainablePhrase(this.phrase.toString());
            newPhrase.phrase.append(" ").append(word);
            return newPhrase;
        }

        public String phrase() {
            return this.phrase.toString();
        }
    }

    // say method to initiate the chainable phrase
    public static ChainablePhrase say() {
        return new ChainablePhrase("");
    }

    public static ChainablePhrase say(String word) {
        return new ChainablePhrase(word);
    }


    //Problem 3
    public static int meaningfulLineCount(String filename) throws IOException {
        try (var reader = new BufferedReader(new FileReader(filename))) {
            return (int) reader.lines()
                    .filter(line -> !line.isBlank() && !line.trim().startsWith("#"))
                    .count();
        } catch (FileNotFoundException e) {
            throw new FileNotFoundException("No such file: " + filename);
        }
    }

}

// Problem 4 - Used Homework Helper 2 as reference
final record Quaternion(double a, double b, double c, double d) {

    public final static Quaternion ZERO  = new Quaternion(0,0,0,0);
    public final static Quaternion I = new Quaternion(0,1,0,0);
    public final static Quaternion J = new Quaternion(0,0,1,0);
    public final static Quaternion K = new Quaternion(0,0,0,1);

    //catch invalid inputs
    public Quaternion {
        if (Double.isNaN(a) || Double.isNaN(b) || Double.isNaN(c) || Double.isNaN(d)) {
            throw new IllegalArgumentException("Coefficients cannot be NaN");
        }
    }

    Quaternion plus(Quaternion other) {
        return new Quaternion (a + other.a, b + other.b, c + other.c, d + other.d);
    }

    Quaternion times(Quaternion other) {
        return new Quaternion(
            a * other.a - b * other.b - c * other.c - d * other.d,
            a * other.b + b * other.a + c * other.d - d * other.c,
            a * other.c - b * other.d + c * other.a + d * other.b,
            a * other.d + b * other.c - c * other.b + d * other.a);
    }

    public Quaternion conjugate() {
        return new Quaternion(a,-b,-c,-d);
    }

    public List<Double> coefficients() {
        return List.of(a, b, c, d);
    }

    private String formatTerm(double realNum, String vector) {
        if (realNum == 0.0) {
            return "";
        } else if (realNum == 1.0) {
            return vector;
        } else if (realNum == -1.0) {
            return "-" + vector;
        } else {
            return realNum + vector;
        }
    }

    @Override
    public String toString() {
        List<String> stringRep = new ArrayList<>();
        if (a != 0.0) {
            stringRep.add(Double.toString(a));
        }
        stringRep.add(formatTerm(b, "i"));
        stringRep.add(formatTerm(c, "j"));
        stringRep.add(formatTerm(d, "k"));
        List<String> filteredStringRep = stringRep.stream().filter(term -> !term.isEmpty()).toList();
        if (filteredStringRep.isEmpty()) {
            return "0";
        }
        String result = String.join("+", filteredStringRep).replace("+-", "-");
        return result;
    }
}

// Problem 5 - Used Homework2 helper as referrence
sealed interface BinarySearchTree permits Empty, Node{
    int size();
    boolean contains(String value);
    BinarySearchTree insert(String value);
}

final record Empty() implements BinarySearchTree {
    @Override
    public int size() {
        return 0;
    }

    @Override
    public boolean contains(String value) {
        return false;
    }

    @Override
    public BinarySearchTree insert(String value) {
        return new Node(value, this, this);
    }

    @Override
    public String toString() {
        return "()";
    }
}

final class Node implements BinarySearchTree {
    private final String value;
    private final BinarySearchTree left;
    private final BinarySearchTree right;

    Node(String value, BinarySearchTree left, BinarySearchTree right) {
        this.value = value;
        this.left = left;
        this.right = right;
    }

    @Override
    public int size() {
        return 1 + left.size() + right.size();
    }

    @Override
    public boolean contains(String value) {
        return this.value.equals(value) || left.contains(value) || right.contains(value);
    }

    @Override
    public BinarySearchTree insert(String value) {
        if (value.compareTo(this.value) < 0) {
            return new Node(this.value, left.insert(value), right);
        } else {
            return new Node(this.value, left, right.insert(value));
        }
    }
    
    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        if (!(left instanceof Empty)) {
            sb.append(left);
        }
        sb.append(value);
        if (!(right instanceof Empty)) {
            sb.append(right); 
        }
        return "(" + sb + ")";
    }
}

