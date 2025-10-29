// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract RailwayReservation {
    // Admin (owner) of the contract
    address public owner;

    constructor() {
        owner = msg.sender; // Contract deployer is the owner
    }

    // Structure to represent a train
    struct Train {
        uint id;
        string name;
        uint totalSeats;
        uint availableSeats;
        uint fare; // in wei
    }

    // Mapping trainId => Train details
    mapping(uint => Train) public trains;

    // Mapping trainId => passengers list
    mapping(uint => address[]) public passengers;

    // Counter for train IDs
    uint public trainCount = 0;

    // Modifier to restrict certain functions to the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // Function to add a new train
    function addTrain(string memory _name, uint _totalSeats, uint _fare) public onlyOwner {
        require(_totalSeats > 0, "Total seats must be greater than zero");
        require(_fare > 0, "Fare must be greater than zero");

        trainCount++;
        trains[trainCount] = Train(trainCount, _name, _totalSeats, _totalSeats, _fare);
    }

    // Function to book a seat
    function bookSeat(uint _trainId) public payable {
        Train storage train = trains[_trainId];
        require(train.id != 0, "Train does not exist");
        require(train.availableSeats > 0, "No seats available");
        require(msg.value == train.fare, "Incorrect fare amount");

        // Book seat
        train.availableSeats--;
        passengers[_trainId].push(msg.sender);
    }

    // Get list of passengers for a train
    function getPassengers(uint _trainId) public view returns (address[] memory) {
        return passengers[_trainId];
    }

    // Withdraw funds to owner
    function withdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }
}

