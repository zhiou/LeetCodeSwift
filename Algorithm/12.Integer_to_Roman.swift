/*
 * @lc app=leetcode.cn id=12 lang=swift
 *
 * [12] 整数转罗马数字
 */

// @lc code=start
class Solution {
    private let unit: [Character] = ["N", "M", "D", "C", "L", "X", "V", "I"]

    func intToRoman(_ num: Int) -> String {
        var num = num
        let divide = [1000, 100,  10, 1]
        var ret: [Character] = []
        for i in 0..<4 {
            let digit = num / divide[i]
            num %= divide[i]
            if digit != 0 {
                if digit < 4 {
                    ret.append(contentsOf: [Character](repeating: unit[i * 2 + 1], count: digit))
                }
                else if digit == 4 {
                    ret.append(unit[i * 2 + 1])
                    ret.append(unit[i * 2])
                }
                else if digit == 9 {
                    ret.append(unit[i * 2 + 1])
                    ret.append(unit[i * 2 - 1])
                }
                else {
                    ret.append(unit[i * 2])
                    ret.append(contentsOf: [Character](repeating: unit[i * 2 + 1], count: digit - 5))
                }
            }
        }

        return String(ret)
    }
}
// @lc code=end

