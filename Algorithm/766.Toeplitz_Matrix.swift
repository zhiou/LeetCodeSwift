/*
 * @lc app=leetcode.cn id=766 lang=swift
 *
 * [766] 托普利茨矩阵
 */

// @lc code=start
class Solution {
    func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {
        if matrix.count <= 1 {
            return true
        }
        let row = matrix.count - 1
        let column = matrix[0].count - 1
        
        for c in 0...column {
            let v = matrix[row][c]
            var i = row - 1
            var j = c - 1
            while i >= 0, j >= 0 {
                if matrix[i][j] != v {
                    return false
                }
                i -= 1
                j -= 1
            }
        }
        for r in 0...row-1 {
            let v = matrix[r][column]
            var i = r - 1
            var j = column - 1
            while i >= 0, j >= 0 {
                if matrix[i][j] != v {
                    return false
                }
                i -= 1
                j -= 1
            }
        }
        return true
    }
}
// @lc code=end

