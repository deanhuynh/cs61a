def ab_plus_c(a, b, c):
    """Computes a * b + c.

    >>> ab_plus_c(2, 4, 3)  # 2 * 4 + 3
    11
    >>> ab_plus_c(0, 3, 2)  # 0 * 3 + 2
    2
    >>> ab_plus_c(3, 0, 2)  # 3 * 0 + 2
    2
    """
    def multiply(f, g):
        if(g > 0):
            return f + multiply(f, g - 1)
        else:
            return 0
    return c + multiply(a, b)


def gcd(a, b):
    """Returns the greatest common divisor of a and b.
    Should be implemented using recursion.

    >>> gcd(34, 19)
    1
    >>> gcd(39, 91)
    13
    >>> gcd(20, 30)
    10
    >>> gcd(40, 40)
    40
    """
    if(a == 0 or b == 0):
        return 1
    elif(a >= b and a % b == 0):
        return b
    elif(b > a and a % b == 0):
        return b
    elif(a > b):
        return gcd(b, a % b)
    else:
        return gcd(a, b % a)

def hailstone(n):
    """Print out the hailstone sequence starting at n, and return the
    number of elements in the sequence.

    >>> a = hailstone(10)
    10
    5
    16
    8
    4
    2
    1
    >>> a
    7
    """
    def stone(n, steps):
        print(int(n))
        if(n == 1):
            return steps
        elif(n % 2 == 0):
            return stone(n / 2, steps + 1)
        else:
            return stone(3 * n + 1, steps + 1)
    return stone(n, 1)
