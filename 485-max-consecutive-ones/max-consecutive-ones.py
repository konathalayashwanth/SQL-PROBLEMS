class Solution:
    def findMaxConsecutiveOnes(self, nums: List[int]) -> int:
        sum=0
        maxcount=0
        for i in nums:
            if i==1:
                sum+=1
            else:
                sum=0
            if sum>maxcount:
                maxcount=sum
        return maxcount