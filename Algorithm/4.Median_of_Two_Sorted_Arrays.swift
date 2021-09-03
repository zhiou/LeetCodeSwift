/*
 * @lc app=leetcode.cn id=4 lang=swift
 *
 * [4] 寻找两个正序数组的中位数
 */

// @lc code=start
class Solution {
    private func helper(_ num1: [Int], _ i: Int, _ j: Int, _ num2: [Int], _ k: Int, _ l: Int) -> Double {
        var i = i, j = j, k = k, l = l
        if i > j, k > l {
            return 0
        }
        else if i > j, k <= l {
            if (l - k) % 2 == 0 { // odd
                return Double(num2[(k+l)/2])
            } else { //even
                return Double(num2[(k+l)/2] + num2[(k+l)/2 + 1]) / 2
            }
        }
        else if k > l, i <= j {
            return helper(num2, k, l, num1, i, j)
        }
        else if i == j, k == l {
            return Double(num1[i] + num2[k]) / 2
        }
        else {
            if num1[j] <= num2[k] {
                i += 1
                l -= 1
            }
            else if num2[l] <= num1[i] {
                k += 1
                j -= 1
            } else {
                if num1[i] <= num2[k] {
                    i += 1
                } else {
                    k += 1
                }
                if i <= j, k <= l, num1[j] <= num2[l] {
                    l -= 1
                } else {
                    j -= 1
                }
            }
            return helper(num1, i, j, num2, k, l)
        }
    }

    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
         return helper(nums1, 0, nums1.count - 1, nums2, 0, nums2.count - 1)
    }
}
// @lc code=end

