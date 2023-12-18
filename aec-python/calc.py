import argparse

def aec_subtract(ints_to_sub):
    if len(ints_to_sub) != 2:
        raise Exception("Can only be run with 2 integers")
    arg_1 = ints_to_sub[0]
    arg_2 = ints_to_sub[1]
    our_sub = arg_1 - arg_2
    if our_sub < 0:
        our_sub = 0
    print(f"The subtracted result is {our_sub}")
    return our_sub

def aec_divide(ints_to_div):
    if len(ints_to_div) != 2:
        raise Exception("Can only be run with 2 integers")
    arg_1 = ints_to_div[0]
    arg_2 = ints_to_div[1]
    if arg_2 == 0:
        our_div = 0
        print("cannot divide")
    else:
        our_div = arg_1 / arg_2
        print(f"The quotient is {our_div}")
    return our_div

parser = argparse.ArgumentParser(description = "CLI calculator")
subparsers = parser.add_subparsers(help="sub-command help", dest="command")

add = subparsers.add_parser("add", help="add integers")
add.add_argument("ints_to_sum", nargs='*', type=int)
sub = subparsers.add_parser("sub", help="subtract integers")
sub.add_argument("ints_to_sub", nargs=2, type=int)
mult = subparsers.add_parser("mult", help=" multiply integers")
mult.add_argument("ints_to_mult", nargs='*', type=int)
div = subparsers.add_parser("div", help="divide integers")
div.add_argument("ints_to_div", nargs='*', type=int)

if __name__ == "__main__":
    args = parser.parse_args()

    if args.command == "add":
        our_sum = sum(args.ints_to_sum) 
        print(f"The sum of values is {our_sum}")
    if args.command == "sub":
        aec_subtract(args.ints_to_sub)
    if args.command == "mult":
        our_mult = 1
        for x in args.ints_to_mult:
            our_mult = our_mult * x
        print(f"The product of values is {our_mult}")
    if args.command == "div":
        aec_divide(args.ints_to_div)