// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;

contract SimpleStorage {
    // boolean, uint, int, address, bytes, string
    // bool hasFavoriteNumber = true;
    // uint favoriteNumber = 256;
    // int64 favoriteInt = -255;
    // string favoriteNumberInText = "Two Hundred & Fifty Six";
    // address myAddress = 0xE60B9C8a0dD31CD8b9fC74D2F2BcA15b1Ac01A4a;
    // bytes32 favoritByte = "cat"

    // This gets initialized to zero
    // <- This means that this section is a comment
    uint256 favoriteNumber; // this variable is automatically indexed to zero within this contract
    // People public person = People({favoriteNumber: 2, name: "Jane"});

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    // uint256[] public favoriteNumbersList;
    People[] public people;

    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
        // retrieve();
    }

    // funtions that dont't require gas to execute - 'view' && 'pure' keywords

    // view function disallows modification of state
    // and can only read data from storage
    function retrieve() public view returns(uint256) {
        return favoriteNumber;
    } 

    // calldata, memory, storage
    // calldata is temporary variables that cannot be modified
    // memory is temporary variables that can be modified
    // storage is permanent variables that can be modified
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // _name = "cat";
        // this works the same as the code below it
        // People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        // people.push(newPerson);
        // this line of code doesn't require the 'memory keyword
        // but it is considered to be less explicit than the code above
        people.push(People(_favoriteNumber, _name));
    }

    // pure function disallows state modification
    // and reading data from storage
    // can be used for reusable computation/algorithm
    function add() public pure returns(uint256) {
        return(1+1);
    }
}
// 0xd9145CCE52D386f254917e481eB44e9943F39138

contract valueTypes {
    bool public b = true;
    uint public u = 123; // ranges from 0 to 2 ** 256 - 1
    int public i = -123; // ranges from -2 ** 255 - 1 to 2 ** 255 - 1

    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    address public addr = 0xE3Ca443c9fd7AF40A2B5a95d43207E763e56005F;
    bytes32 public b32 = 0x6f7e4d3c2b1a8f9e0d5c6a7b8e9f1a0d2c3b4e5f6a7b8c9d0e1f2a3b4c5d6e7f;
}