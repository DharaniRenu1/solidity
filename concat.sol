pragma solidity^0.4.0;
library stringg
{
    function concat(string a,string b)internal returns(string)
    {
        bytes memory aa=bytes(a);
         bytes memory bb=bytes(b);
         string memory temp=new string(aa.length+bb.length);
         bytes memory newval=bytes(temp);
         uint256 i;
         uint256 j;
         for(i=0;i<aa.length;i++)
         newval[i++]=aa[i];
         for(j=0;j<bb.length;j++)
         newval[j++]=bb[j];
         return string(newval);
    }
}
    contract sample
    {
        using stringg for string;
        function ret(string a,string b)public constant returns(string)
        {
            return stringg.concat(a,b);
        }
}
