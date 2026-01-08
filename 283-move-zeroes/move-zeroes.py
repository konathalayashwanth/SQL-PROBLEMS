class Solution:
    def moveZeroes(self, nums: List[int]) -> None:
        start = 0
        for i in range(0,len(nums)):
            if nums[i]!=0:
                nums[start],nums[i] = nums[i], nums[start]
                start+=1
        return nums

