class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        ans=""
        strs=sorted(strs)
        size=len(strs)
        first=strs[0]
        last=strs[size-1]
        for i in range(min(len(first),len(last))):
            if first[i]!=last[i]:
                return ans
            ans+=first[i]
        return ans


        