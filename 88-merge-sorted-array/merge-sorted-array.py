class Solution:
    def merge(self, nums1: List[int], m: int, nums2: List[int], n: int) -> None:
        p1=m-1
        p2=n-1
        for x in range(m+n-1,-1,-1):
            if p2<0:
                break;
            if nums1[p1]>nums2[p2] and p1>=0:
                nums1[x]=nums1[p1]
                p1=p1-1
            else:
                nums1[x]=nums2[p2]
                p2=p2-1



        