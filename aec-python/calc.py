import argparse

def aec_subtract(ints_to_sub):
    arg_1 = ints_to_sub[0]
    arg_2 = ints_to_sub[1]
    our_sub = arg_1 - arg_2
    if our_sub < 0:
        our_sub = 0
    print(f"The subtracted result is {our_sub}")
    return our_sub

parser = argparse.ArgumentParser(description = "CLI calculator")
subparsers = parser.add_subparsers(help="sub-command help", dest="command")

add = subparsers.add_parser("add", help="add integers")
add.add_argument("ints_to_sum", nargs='*', type=int)
add = subparsers.add_parser("sub", help="subtract integers")
add.add_argument("ints_to_sub", nargs=2, type=int)
add = subparsers.add_parser("mult", help="multiply integers")
add.add_argument("ints_to_mult", nargs=2, type=int)
add = subparsers.add_parser("div", help="divide integers")
add.add_argument("ints_to_div", nargs=2, type=int)

if __name__ == "__main__":
    args = parser.parse_args()

    if args.command == "add":
        our_sum = sum(args.ints_to_sum) 
        print(f"The sum of values is {our_sum}")
    if args.command == "sub":
        our_sub = aec_subtract(ints_to_sub)
        print(f"The subtracted results of values is {our_sub}")
    if args.command == "mult":
        our_mult = args.ints_to_mult[0] * args.ints_to_mult[1]
        print(f"The multiplied results of values is {our_mult}")
    if args.command == "div":
        if args.ints_to_div[1] == 0:
            print("cannot divide")
        else:
            our_div = args.ints_to_div[0] / args.ints_to_div[1]
            print(f"The divided results of values is {our_div}")