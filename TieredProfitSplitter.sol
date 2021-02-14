pragma solidity ^0.5.0;

// lvl 2: tiered split
contract TieredProfitSplitter {
    
    // set owner address as contract owner msg.sender
    address payable owner = msg.sender;
    
    // Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    
    address payable public employee_one;   // ceo 
    address payable public employee_two;   // cto 
    address payable public employee_three; // bob
    
    // Constructor to accept and set emplyee adrresses
    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
    
    function deposit() public payable {
        
        // only contract owner can do the transfer/deposit
        require (msg.sender == owner, "You do not own this account!"); 

        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units
        uint total;
        uint amount;

        // Calculate and transfer the distribution percentage
        amount = points * 60;
        total += amount;
        employee_one.transfer(amount);

        // Repeat the previous steps for `employee_two` and `employee_three`
        amount = points * 25;
        total += amount;
        employee_two.transfer(amount);

        amount = points * 15;
        total += amount;
        employee_three.transfer(amount);

        //  take care of a potential remainder by adding it to the ceo's balance
        if (msg.value - total > 0) {
            employee_one.transfer(msg.value - total);  // ceo gets the remaining wei
        }
        
    }

    function() external payable {
        
        // Enforce that the `deposit` function is called in the fallback function!
        deposit();
    }
}