pragma solidity >=0.4.22 <0.8.0;

import "@openzeppelin/contracts/math/SafeMath.sol";

contract LifeInsurance{
    using SafeMath for uint;
    enum Statuses {Alive, Deceased}
    Statuses currentStatus;
    
    address payable insurer;
    address payable insured;
    uint premiums;
    uint cashValue;
    
    mapping(uint=>Beneficiary) public beneficiary;
    mapping(uint=> Selection) insuranceType;
    mapping(uint=>moreOptions) Rider;
    
    constructor() public{
        cashValue = 250000 ether;
        currentStatus= Statuses.Alive;
    }
    
    struct Beneficiary{
        string relationship;
        string name;
    }
    
    struct Selection{
        string policy;
        string savings;
    }
    
    struct moreOptions{
        string extraCoverage;
        string charges;
    }

    function getCashValue() public view returns(uint){
        return cashValue;
    }
    
    function setPremiums() public {
        premiums = 40;
    }
    
   
    function percCashValue(uint percent) public view returns(uint){
        uint numerator = cashValue.mul(percent);
        return numerator.div(100);
    }
    
    function beneficiaries(uint _id, string memory _relationship, string memory _name) public {
        currentStatus= Statuses.Deceased;
        beneficiary[_id]= Beneficiary(_relationship, _name);
    }
    
    function policyType(uint _id, string memory _policy, string memory _savings) public {
        currentStatus= Statuses.Deceased;
        insuranceType[_id]= Selection(_policy,_savings);
    }
    
    function extraInsurance(uint _id, string memory _extraCoverage, string memory _charges) public {
        currentStatus= Statuses.Deceased;
        Rider[_id]= moreOptions(_extraCoverage,_charges);
    }
    function payBenefit(address payable beneficiaryAddr, uint percPayout) public payable {
        uint payoutAmt = percCashValue(percPayout);
        require(msg.value==payoutAmt);
        beneficiaryAddr.transfer(msg.value);
    }
}

// contract Distribution is Lifeinsurance {
//     address payable public owner;
 
//     mapping(address=>mapping(string=>Beneficiary))public myBeneficiary;
    
//      constructor()public {
//         owner = msg.sender;
//      }
     
//      function beneficts() public payable{
//         owner.transfer(msg.value);
//      }
     
//      function trust(uint _id, string memory name, string memory relationship) public payable {
//          owner;
//      }
// }