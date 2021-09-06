/*
 * @lc app=leetcode.cn id=8 lang=swift
 *
 * [8] 字符串转换整数 (atoi)
 */

// @lc code=start
class Solution {
    func myAtoi(_ s: String) -> Int {

        var index = s.startIndex

        var s = s.trimmingCharacters(in: .whitespaces)

        if s.isEmpty {
            return 0
        }

        var mul: Int = 1
        if s[index] == "+" || s[index] == "-" {
            mul = s[index] == "+" ? 1 : -1
            index = s.index(after: index)

        }
        var ret: Int = 0

        while index < s.endIndex {
            if !s[index].isNumber {
                break
            }

            if let val = s[index].wholeNumberValue {
                ret *= 10
                ret += val
            }
            if mul > 0, ret > Int32.max {
                return Int(Int32.max)
            }
            else if mul < 0, ret * mul < Int32.min {
                return Int(Int32.min)
            }
            index = s.index(after: index)
        }
        return ret * mul
    }
}
// @lc code=end

