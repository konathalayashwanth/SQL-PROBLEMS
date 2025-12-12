class Solution:
    def reverse(self,nums:list,start:int,end:int) -> None:
        while start<end:
            nums[start],nums[end]=nums[end],nums[start]
            start=start+1
            end=end-1
    def rotate(self, nums: List[int], k: int) -> None:
        size=len(nums)
        k=k%size
        self.reverse(nums,0,size-1)
        self.reverse(nums,0,k-1)
        self.reverse(nums,k,size-1)
