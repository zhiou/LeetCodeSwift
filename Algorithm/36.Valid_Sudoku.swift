/*
 * @lc app=leetcode.cn id=36 lang=swift
 *
 * [36] 有效的数独
 */

// @lc code=start
class Solution {

    private var table: [Character: Int] = [:]
    private var table1: [Character: Int] = [:]
    private var table2: [Character: Int] = [:]
    private let keys: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]

    init() {
        reset()
    }

    private func reset() {
        keys.forEach { key in
            table[key] = 0
            table1[key] = 0
            table2[key] = 0
        }
    }

    func isValidSudoku(_ board: [[Character]]) -> Bool {
        for i in 0..<9 {
            for j in 0..<9 {
                if board[j][i] != "." && table[board[j][i]] == 1 {
                    return false
                } else if board[j][i] != "." {
                    table[board[j][i]] = table[board[j][i]]! + 1
                }

                if board[i][j] != "." && table1[board[i][j]] == 1 {
                    return false
                } else if board[i][j] != "." {
                    table1[board[i][j]] = table1[board[i][j]]! + 1
                }

                let m = i % 3 * 3 + j / 3
                let n = i / 3 * 3 + j % 3
                if board[m][n] != "." && table2[board[m][n]] == 1 {
                    return false
                } else if board[m][n] != "." {
                    table2[board[m][n]] = table2[board[m][n]]! + 1
                }
            }
            reset()
        }
        return true
    }
}
// @lc code=end

