class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        new_nums=nums.copy()
        new_nums.sort()
        i=0
        j=len(nums)-1
        while(i<j):

            if(new_nums[i]+new_nums[j]==target):

                if(new_nums[i]==new_nums[j]):

                    return [nums.index(new_nums[i]),nums.index(new_nums[j],nums.index(new_nums[i])+1)]
                else:

                    return [nums.index(new_nums[i]),nums.index(new_nums[j])]   
            elif(new_nums[i]+new_nums[j]<target):

                i=i+1
            else:

                j=j-1
                

        
