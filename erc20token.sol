pragma solidity^0.4.0; 
import "./Ownable.sol"; 
contract token is Ownable {
address owner;
string public name; 
string public symbol; 
uint256 public totalSupply; 
bool public paused=false; 
mapping(address=>uint)balance;
mapping(address=>mapping(address=>uint))allowed;
function token() { owner=msg.sender; name="dharani"; symbol="$"; totalSupply=1000; balance[owner]=totalSupply; }
function total_supply()public returns(uint256) { return totalSupply; } 
function balanceOf(address owner)public constant returns(uint) { return balance[owner]; }
function transfer(address to,uint token)whenNotPaused public constant returns(uint,uint) 
{ if(token>0&&token<=balance[msg.sender])
{ balance[owner]=balance[owner]-token; balance[to]=balance[to]+token;

  return (balance[owner], balance[to]);
     }
 }
  function transferfrom(address from,address to,uint token)public  returns(uint,uint)
  {
    if(balance[from] >=token && token > 0 && allowed[from][to] >= token)
    {
         
      balance[from]=balance[owner]-token;
       balance[to]=balance[to]+token;
      allowed[from][owner]=allowed[from][owner]-token;
     
      return  (balance[from], balance[to]);
    }
   }
   function approval(address from,uint token)public  returns(uint)
      {
                allowed[from][owner]=token;
      } 
      function incapproval(address from,uint token)public 
      {
                allowed[from][owner]+=token;
      } 
      function decapproval(address from,uint token)public 
      {
                allowed[from][owner]-=token;
      } 
      function allowance(address from)public view  returns(uint remain)
      {
          return allowed[from][owner];
      }
  function mint(address _to, uint256 _amount)onlyOwner public  returns(bool)
{
totalSupply = totalSupply+_amount;
balance[_to] = balance[_to]+_amount;
return true;
}
function burn(address _to, uint256 _amount)onlyOwner public
{
 totalSupply = totalSupply-_amount;
 balance[_to] = balance[_to]-_amount;
}
modifier whenNotPaused() 
{
require(!paused);
_;
}
modifier whenPaused()
{
require(paused);
_;
}
function pause() onlyOwner whenNotPaused public
{
paused = true;
}

function unpause() onlyOwner whenPaused public
{
paused = false;
}
}
contract cappedtoken is token
{
uint public cap;
function cappedtoken(uint _cap)public 
{
    require(_cap>0);
    cap=_cap;
}
function mint(address to,uint amt)public onlyOwner  returns(bool)
{ 
    require(totalSupply+amt<=cap);
    return super.mint(to,amt);
}

}
