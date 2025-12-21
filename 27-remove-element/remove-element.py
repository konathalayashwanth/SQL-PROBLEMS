class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        k=0
        size=len(nums)
        for i in range(0,size):
            if nums[i]!=val:
                nums[k]=nums[i]
                k+=1
        return k
        