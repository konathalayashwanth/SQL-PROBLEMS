class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        insertindex=1
        for i in range(insertindex,len(nums)):
            if nums[i-1]!=nums[i]:
                nums[insertindex]=nums[i]
                insertindex=insertindex+1
        return insertindex
                

                

        
        