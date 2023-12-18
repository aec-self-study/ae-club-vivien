import unittest
from calc import aec_divide

class TestDivision(unittest.TestCase):

    def test_num_args(self):
        arg_ints = [54, 9, 3]
        with self.assertRaisesRegex(Exception, "Can only be run with 2 integers") as context:
            aec_divide(arg_ints)

    def test_division(self):
        arg_ints = [20, 5]
        div_result = aec_divide(arg_ints)
        self.assertEqual(div_result, 4)

    def test_divisor_zero(self):
        arg_ints = [36, 0]
        div_result = aec_divide(arg_ints)
        self.assertEqual(div_result, 0)

if __name__ == '__main__':
    unittest.main()