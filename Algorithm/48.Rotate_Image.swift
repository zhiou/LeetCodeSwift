/*
 * @lc app=leetcode.cn id=48 lang=swift
 *
 * [48] 旋转图像
 */

// @lc code=start
class Solution {
    func rotate(_ matrix: inout [[Int]]) {
        let row = matrix.count - 1
        let column = row

        for i in 0..<(matrix.count/2) {
            for j in i...(column - 1 - i ) {
                var temp: Int = 0
                swap(&matrix[i][j], &temp)
                swap(&matrix[row-j][i], &temp)
                swap(&matrix[i][j], &temp)

                swap(&matrix[row-j][i], &temp)
                swap(&matrix[row-i][column-j], &temp)
                swap(&matrix[row-j][i], &temp)

                swap(&matrix[row-i][column-j], &temp)
                swap(&matrix[j][column - i], &temp)
                swap(&matrix[row-i][column-j], &temp)
            }
        }
    }


}

// @lc code=end

