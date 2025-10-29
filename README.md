// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
Contract Name: RailwayReservation

Main Components:

struct Train – Stores details about each train.

mapping(uint => Train) – Stores train information.

mapping(uint => address[]) – Keeps track of passengers per train.

modifier onlyOwner() – Restricts functions to the contract owner.
| Function                                            | Access           | Description                                                      |
| --------------------------------------------------- | ---------------- | ---------------------------------------------------------------- |
| `addTrain(string name, uint totalSeats, uint fare)` | Owner only       | Adds a new train to the system.                                  |
| `bookSeat(uint trainId)`                            | Public + Payable | Books one seat on a specified train. Must send the correct fare. |
| `getPassengers(uint trainId)`                       | Public (view)    | Returns a list of passenger addresses for that train.            |
| `withdraw()`                                        | Owner only       | Withdraws all Ether from the contract to the owner’s address.    |
🚀 How to Deploy & Use
1. Setup Environment

You can deploy this contract using:

Remix IDE
 

Hardhat or Foundry for local testing.

2. Deploy the Contract

Copy and paste the contract code into Remix.

Compile with Solidity version ^0.8.20.

Deploy using an Ethereum-compatible wallet (e.g., MetaMask).

3. Add a Train (Admin Only)
addTrain("Express 101", 50, 10000000000000000) // fare = 0.01 ETH in wei

4. Book a Seat (User)
bookSeat(1) // while sending exactly 0.01 ETH

5. View Passengers
getPassengers(1)

6. Withdraw Funds (Admin Only)
withdraw()


![95ec477d-276f-4a6e-b70a-f26586bcabf3](https://github.com/user-attachments/assets/e8edfa19-4510-41b9-9134-c870b8eda6fb)





