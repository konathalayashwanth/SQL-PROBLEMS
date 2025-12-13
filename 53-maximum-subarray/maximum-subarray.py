class Solution:
    def maxSubArray(self, nums: List[int]) -> int:
        sum=0
        maxsum=nums[0]
        for num in nums:
            if sum < 0:
                sum = 0
            sum=sum + num
            if sum > maxsum:
                maxsum = sum
        return maxsum
    





        