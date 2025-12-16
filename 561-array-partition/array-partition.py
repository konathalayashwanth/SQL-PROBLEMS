class Solution:
    def arrayPairSum(self, nums: List[int]) -> int:
        nums.sort()
        res=0
        n=len(nums)
        for i in range(0,n,2):
            
            res+=nums[i]
        return res

        