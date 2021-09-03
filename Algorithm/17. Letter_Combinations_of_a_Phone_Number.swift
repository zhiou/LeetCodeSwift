/*
 * @lc app=leetcode.cn id=17 lang=swift
 *
 * [17] 电话号码的字母组合
 */

// @lc code=start
class Solution {

    private func merge(_ a: [String], _ b: [String]) -> [String] {
        var r: [String] = []
        if a.isEmpty {
            r.append(contentsOf: b)
            return r
        }
        for s in a {
            for c in b {
                r.append(s + c)
            }
        }
        return r
    }

    private let dial: [[String]] = [
        ["a", "b", "c"],
        ["d", "e", "f"],
        ["g", "h", "i"],
        ["j", "k", "l"],
        ["m", "n", "o"],
        ["p", "q", "r", "s"],
        ["t", "u", "v"],
        ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        if digits.isEmpty {
            return []
        }

        let base:Character = "2"
        let selected = digits.map { digit -> [String] in
            let index = Int(digit.asciiValue! - base.asciiValue!)
            return dial[index]
        }

        return selected.reduce([], merge)
    }
}

// @lc code=end

