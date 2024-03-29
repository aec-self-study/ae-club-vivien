import unittest
from calc import aec_subtract


class TestSubtract(unittest.TestCase):
    def test_num_args(self):
        arg_ints = [54, 9, 3]
        with self.assertRaisesRegex(
            Exception, "Can only be run with 2 integers"
        ) as context:
            aec_subtract(arg_ints)

    def test_subtract(self):
        arg_ints = [20, 5]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 15)

    def test_cant_go_below_zero(self):
        arg_ints = [5, 20]
        sub_result = aec_subtract(arg_ints)
        self.assertEqual(sub_result, 0)


if __name__ == "__main__":
    unittest.main()
