/*
 * @lc app=leetcode.cn id=6 lang=swift
 *
 * [6] Z 字形变换
 */

// @lc code=start
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows <= 1 {
            return s
        }
        let groupSize = 2*numRows - 2
        let groupCount = s.count / groupSize + 1
        var ret: [Character] = []
        (0..<numRows).forEach { row in
            (0..<groupCount).forEach { group in
                if row == 0 {
                    if group * groupSize < s.count {
                        let index = s.index(s.startIndex, offsetBy: group * groupSize)
                        ret.append(s[index])
                    }
                }
                else if row == numRows - 1 {
                    if row + group * groupSize < s.count {
                        let started = s.index(s.startIndex, offsetBy: row)
                        let index = s.index(started, offsetBy: group * groupSize)
                        ret.append(s[index])
                    }
                } else {
                    if row + group * groupSize < s.count {
                        let started1 = s.index(s.startIndex, offsetBy: row)
                        let index1 = s.index(started1, offsetBy: group * groupSize)
                        ret.append(s[index1])
                    }

                    if groupSize - row + group * groupSize < s.count {
                        let started2 = s.index(s.startIndex, offsetBy: groupSize - row)
                        let index2 = s.index(started2, offsetBy: group * groupSize)
                        ret.append(s[index2])
                    }
                }
            }
        }
        return String(ret)
    }
}
// @lc code=end

