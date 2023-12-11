x = 2

print(x)

print(x + 5)

y = "hello"

print(y)

z = x**2 + 5*x
print(z)

my_first_list = ['apple', 1, 'banana', 2]
my_fruit_list = ['apple', 'banana']
my_int_list = [1,2,3]

cal_lookup = {'apple': 95, 'banana': 105, 'orange': 45}

for f in my_fruit_list:
    print(f)

for f in my_fruit_list:
    pass
print(f)

def sq_int(x):
    y = x**2
    return y

from sympy import *

y = 5
x = 4
def describe_evenness(x):
    if simplify(x).is_even:
        print("It's even!")
    elif simplify(x).is_odd:
        print("It's odd!")
    else:
        print("It's neither even nor odd!")