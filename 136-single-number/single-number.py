class Solution:
    def singleNumber(self, nums: List[int]) -> int:
        hash_table=defaultdict(int)
        for num in nums:
            hash_table[num]=hash_table[num]+1
        for num in nums:
            if hash_table[num]==1:
                return num




            
        