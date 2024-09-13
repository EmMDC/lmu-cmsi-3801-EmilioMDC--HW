from dataclasses import dataclass


def change(amount: int) -> dict[int, int]:
    if not isinstance(amount, int):
        raise TypeError('Amount must be an integer')
    if amount < 0:
        raise ValueError('Amount cannot be negative')
    counts, remaining = {}, amount
    for denomination in (25, 10, 5, 1):
        counts[denomination], remaining = divmod(remaining, denomination)
    return counts


def first_then_lower_case(list, predicate, /):
    for x in list:
        if predicate(x):
            return x.lower()
    return None


def powers_generator(*, base, limit):
    exponent = 0
    value = base ** exponent
    while value <= limit:
        yield value
        exponent += 1
        value = base ** exponent
        


def say(word=None):
    if word is None:
        return ""
    
    def next_word(next=None):
        if next is None:
            return word
        else:
            return say(f"{word} {next}")
    
    return next_word

    
def meaningful_line_count(filename, /):
    try:
        valid_lines = 0
        with open(filename, 'r', encoding='utf-8') as file:
            for line in file:
                stripped_line = line.strip()
                if stripped_line and stripped_line[0] != '#':
                    valid_lines += 1
        return valid_lines
    except FileNotFoundError:
        raise FileNotFoundError(f"No such file: {filename}")


@dataclass(frozen=True)
class Quaternion:
    a:float
    b:float
    c:float
    d:float

    def __init__(self, a, b, c, d, /):
        object.__setattr__(self, 'a', a)
        object.__setattr__(self, 'b', b)
        object.__setattr__(self, 'c', c)
        object.__setattr__(self, 'd', d)

    def __str__(self):
        def format_term(value, unit):
            if value == 0:
                return ""
            elif value == 1:
                return unit
            elif value == -1:
                return f"-{unit}"
            else:
                return f"{value}{unit}"

        string_rep = []
        if self.a != 0:
            string_rep.append(str(self.a))
        string_rep.append(format_term(self.b, 'i'))
        string_rep.append(format_term(self.c, 'j'))
        string_rep.append(format_term(self.d, 'k'))

        filtered_string_rep = []
        for term in string_rep:
            if term:
                filtered_string_rep.append(term)
        string_rep = filtered_string_rep
        
        if not string_rep:
            return "0"
        
        ans = "+".join(string_rep)
        return ans.replace("+-", "-")
    
    def __eq__(self, other):
        return self.a == other.a and self.b == other.b and self.c == other.c and self.d == other.d
    
    def __mul__(self,other):
        return Quaternion(self.a * other.a - self.b * other.b - self.c * other.c - self.d * other.d,
      self.a * other.b + self.b * other.a + self.c * other.d - self.d * other.c,
      self.a * other.c - self.b * other.d + self.c * other.a + self.d * other.b,
      self.a * other.d + self.b * other.c - self.c * other.b + self.d * other.a)

    def __add__(self, other):
        return Quaternion(self.a + other.a, self.b + other.b, self.c + other.c, self.d + other.d)
    
    @property
    def coefficients(self):
        return (self.a, self.b, self.c, self.d)
    
    @property
    def conjugate(self):
        return Quaternion(self.a, -self.b, -self.c, -self.d)

