/*
 * @lc app=leetcode.cn id=42 lang=swift
 *
 * [42] 接雨水
 */

// @lc code=start
class Solution {
    func trap(_ height: [Int]) -> Int {
        var i = 0
        var total = 0
        while i < height.count {
            var l = i, r = l+1, lh=height[l]
            var sum = 0
            if lh == 0 {
                i += 1
                continue
            }
            var max = 0, maxIndex = 0
            while r < height.count, height[r] < lh {
                if max < height[r] {
                    max = height[r]
                    maxIndex = r
                }
                sum += lh - height[r]
                r += 1
            }
            if r == height.count {
                if max != 0 && max < lh && maxIndex != l+1 {
                    for k in (l+1)...maxIndex {
                        total += max - height[k]
                    }
                    i = maxIndex
                } else {
                    i = l + 1
                }
            } else {
                total += sum
                i = r
            }
        }
        return total
    }
}
// @lc code=end

