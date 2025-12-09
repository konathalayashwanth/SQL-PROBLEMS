class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        dict={}
        for i in range(0,len(nums)):
            complement=target-nums[i]
            if complement in dict:
                return [i,dict[complement]]
            dict[nums[i]]=i
