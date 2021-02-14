# solidity-hw20
Solidity homework 20

## Background

Your new startup has created its own Ethereum-compatible blockchain to help connect financial institutions, and the team wants to build smart contracts to automate some company finances to make everyone's lives easier, increase transparency, and to make accounting and auditing practically automatic!

* **Level One** is an `AssociateProfitSplitter` contract. This will accept Ether into the contract and divide the Ether evenly among the associate level employees. This will allow the Human Resources department to pay employees quickly and efficiently.

* **Level Two** is a `TieredProfitSplitter` that will distribute different percentages of incoming Ether to employees at different tiers/levels. For example, the CEO gets paid 60%, CTO 25%, and Bob gets 15%.

* **Level Three** is a `DeferredEquityPlan` that models traditional company stock plans. This contract will automatically manage 1000 shares with an annual distribution of 250 over 4 years for a single employee.

The following testnet addresses are used for reference in this document for the first 2 contracts

**Owner**  
0xD7B48E19E4e00aD5A52332368723DF6D209054Cf  

**Employee_one (CEO)**  
0x679D67a351F4c2D0aD246a5171833a884c784feE

**Employee_two (CTO)**  
0x012774570f8f08bB703931B0C00b0fC3d9cF8739

**Employee_three (Bob)**  
0x884C1F4d397C50555E6819D4a46943859bC60d6B

## 1.   **Level One** `AssociateProfitSplitter` contract
This will accept Ether into the contract and divide the Ether evenly among the associate level employees.

*   Balances before transaction  
    ![Balance before](Images/C1_Balance_B4.png)

*   Contract 1 creation  

    ![C1_contract](Images/C1_contract.png)  
    
*   Deposit 20 ETH evenly among 3 employees addresses using contract 1  

    ![C1_Deposit](Images/C1_Deposit.png)  

*   Balances after deposit  

    ![Balance before](Images/C1_Balance_Aft.png)    

*   Contract log in Ganache  
    ![C1_ganache_aft](Images/C1_contract_aft.png) 

## 2.   **Level Two** `TieredProfitSplitter` contract
This will distribute different percentages of incoming Ether to employees at different tiers/levels.  

*   Balances before transaction  
    ![Balance before](Images/C2_Balance_B4.png)

*   Contract 2 creation  

    ![C2_contract](Images/C2_contract.png)  
    
*   Deposit 21 ETH using tiered points system usng contract 2  
    21/100 = 0.21 The following increase in balance should be visible after deposit  
    CEO = 0.21 * 60 = 12.6  
    CTO = 0.21 * 25 = 5.25  
    Bob = 0.21 * 15 = 3.15  

    ![C2_Deposit](Images/C2_Deposit.png)  

*   Balances after deposit  

    ![Balance after](Images/C2_Balance_Aft.png)   

 
 ## 3.   **Level Three** `DeferredEquityPlan` 
 This contract will automatically manage 1000 shares with an annual distribution of 250 over 4 years for a single employee.

*   Contract 3 creation  

    ![C3_contract](Images/C3_contract.png) 

*   `Distribute` with start time as now gives a Gas exception error  
    ![C3_distribute_err](Images/C3_distribute_err.png)  

*   Fastforward to 100 days, the transaction will go ahead 

    ![C3_fastforward_100](Images/C3_fastforward_100.png)  


## **Deploy `TieredProfitSplitter` contract to a live Kovan Testnet  

Point MetaMask to the Kovan network. Ensure you have test Ether on this network!

*   After switching MetaMask to Kovan, deploy the contracts as before and copy/keep a note of their deployed addresses.  

    ![C2_Kovan_network](Images/C2_Kovan_network.png)  

*   Run Deposit function in Kovan network for contract 2  

    ![C2_kovan_deposit](Images/C2_kovan_deposit.png)  

*   Etherscan log for deposit run. This wi llshow that the deposits were made to 3 addresses from sender using contract# 2

    ![C2_kovan_etherscan](Images/C2_kovan_etherscan.png)  

