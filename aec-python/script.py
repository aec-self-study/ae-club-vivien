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

def is_even(x):
    return x % 2 == 0

def is_odd(x):
    return x % 2 != 0

y = 5
x = 4
def describe_evenness(x):
    if is_even(x):
        print("It's even!")
    elif is_odd(x):
        print("It's odd!")
    else:
        print("It's neither even nor odd!")

f = 0
i = list(cal_lookup)
while f < len(cal_lookup):
    print(cal_lookup[i[f]])
    f += 1

for j in range(len(my_first_list)):
    if isinstance(my_first_list[j], (int, float, complex)):
        my_first_list[j] = my_first_list[j]**2
    elif my_first_list[j] in i:
        print(cal_lookup[my_first_list[j]])
    else:
        pass

def sq_cal(x):
    i = list(x)
    for f in range(len(i)):
        print(x[i[f]]**2)