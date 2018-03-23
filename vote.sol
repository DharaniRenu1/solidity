# solidity
pragma solidity^0.4.0;
contract vote1
{
    uint  tot_count;
    uint time;
    uint greatest;
    uint mtime=now+10 days;
    uint _id;
    uint[] arr;
    struct candy
    {
    string[] name;
    uint id;
    uint cnt; 
  
    }
    struct people
    {
        string[] pname;
        uint[] pno;
        
    }
   
    mapping(uint=>candy)map;
    mapping(uint=>people)mapp;
  
     function vote1() public
    {
        time=now+5 days;
    }
    modifier cm
    {
       
        require(mtime>=time);
        _;
    }
    modifier pm
    {
         uint atime=now+11 days;
        require(atime>=mtime);
        _;
    }
    function canditate(string _name,uint _id)public cm
    {
        map[_id].name.push(_name);
         map[_id].id=_id;

   }
    function peopleVote(string _pname,uint _pno,uint _id)public pm
    {
        mapp[_pno].pname.push(_pname);
        mapp[_pno].pno.push(_pno);
        map[_id].id=_id;
        map[_id].cnt+=1;
        arr.push(map[_id].cnt);
        tot_count +=1;
       
    }
    function totvote()public constant returns(uint)
    {
       return  tot_count;
    }
    function canditateVote(uint _id)public constant returns(uint)
    {
        return  map[_id].cnt;
    }
   function result()public constant returns(string,uint)
   {
       for(uint i=0;i<arr.length;i++)
       {
           if(arr[i]>greatest)
           {
             greatest=arr[i];
           }
       }
     
       return("Wins no:",greatest);
   }
   
}
