/*
 * @lc app=leetcode.cn id=10 lang=swift
 *
 * [10] 正则表达式匹配
 */

// @lc code=start
class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if p.count <= 0 { return s.count <= 0 }
        let match = s.count > 0 && (s.first == p.first  || p.first == ".")
        if p.count > 1, p[p.index(after: p.startIndex)] == "*" {
            return isMatch(s, String(p.dropFirst(2))) || (match && isMatch(String(s.dropFirst()), p))
        } else {
            return match && isMatch(String(s.dropFirst()), String(p.dropFirst()))
        }
    }
}
// @lc code=end

