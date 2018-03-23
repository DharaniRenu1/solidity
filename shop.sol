pragma solidity^0.4.0;
contract asd
{
  
     uint q;
    struct pro
    {
        uint pid;
        uint pqty;
        uint pprice;
     
    }
    struct cust
    {
        uint cid;
        uint cqty;
        uint[] cp;
    }
    mapping(uint=>pro)shop;
    mapping(uint=>cust)cus;
 
    
    function shopp(uint _id,uint _qty,uint _price)public 
    {
        shop[_id].pid=_id;
        shop[_id].pqty=_qty;
        shop[_id].pprice=_price;
      }
    
    function custt(uint _id,uint _qty) public 
    {
          
       cus[_id].cid=_id;
       cus[_id].cqty=_qty;
        cus[_id].cp.push(cus[_id].cid);
       if(shop[_id].pqty>=cus[_id].cqty)
       shop[_id].pprice* cus[_id].cqty;
       
       }
       function customersproduct(uint _id)public constant returns(uint,uint[])
       {
           return(shop[_id].pprice* cus[_id].cqty,cus[_id].cp);
       }
}
