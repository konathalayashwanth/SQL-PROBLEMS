class Solution:
    def removeDuplicates(self, nums: List[int]) -> int:
        insertindex=1
        size=len(nums)
        for i in range(insertindex,size):
            if nums[i-1]!=nums[i]:
                nums[insertindex]=nums[i]
                insertindex=insertindex+1
        return insertindex
                

                

        
        