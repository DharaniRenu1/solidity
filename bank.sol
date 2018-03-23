# solidity

Skip to content
This repository

    Pull requests
    Issues
    Marketplace
    Explore

    @DharaniRenu1

0
0

    0

DharaniDD/solidity
Code
Issues 0
Pull requests 0
Projects 0
Wiki
Insights
solidity/bank.sol
9395632 16 days ago
@DharaniDD DharaniDD Create bank.sol
68 lines (63 sloc) 1.8 KB
# solidity
pragma solidity ^0.4.0;
import "./Ownable.sol";
contract bank
{
    address  owner;

    string public name;
    string public symbol;
    uint256 public totalSupply;
    mapping(address=>uint256)balance;
    mapping(address=>mapping(address=>uint256))allowed;
    function bank()
    {
        owner=msg.sender;
        name="dharani";
        symbol="$";
        totalSupply=1000;
        owner=msg.sender;
        balance[owner]=totalSupply;
    }
         function total_supply()public  returns(uint256)
     {
              return totalSupply;
     } 
    function balanceOf(address owner)public constant returns(uint256)
    {
        return balance[owner];
    }
    function deposit(uint256 amt)public returns(uint256)
    {
        balance[owner]+=amt;
        return(balance[owner]);
    }
     function withdraw(uint256 amt)public returns(uint256)
    {
        balance[owner]-=amt;
        return(balance[owner]);
    }
     function transfer(address to,uint256 amt)public returns(uint256,uint256)
    {
        balance[owner]-=amt;
        balance[to]+=amt;
        return(balance[owner],balance[to]);
    }
    
    function approval(address from,uint token)public  returns(uint)
          {
                    allowed[from][owner]=token;
          } 
           function allowance(address from)public view  returns(uint remain)
          {
              return allowed[from][owner];
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
}

    © 2018 GitHub, Inc.
    Terms
    Privacy
    Security
    Status
    Help

    Contact GitHub
    API
    Training
    Shop
    Blog
    About

Press h to open a hovercard with more details.
