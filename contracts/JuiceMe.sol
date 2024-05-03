// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

interface IERC20Token {
    function transfer(address, uint256) external returns (bool);

    function approve(address, uint256) external returns (bool);

    function transferFrom(
        address,
        address,
        uint256
    ) external returns (bool);

    function totalSupply() external view returns (uint256);

    function balanceOf(address) external view returns (uint256);

    function allowance(address, address) external view returns (uint256);

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(
        address indexed owner,
        address indexed spender,
        uint256 value
    );
}

contract CoffeePortal {
    uint256 totalCoffee; //track the total coffee bought.
    uint256 coffeePrice;  //stores price of one cofeerr in terms of specified ERC20 token.

    address payable public owner;

    event NewCoffee(
        address indexed from,
        uint256 timestamp,
        string message,
        string name
    );
    //above is fired when someone buys cofee. it returns address, timestamp, message
    //and name of sender.

    address internal cUsdTokenAddress = 0x5b207C79fd665d33D74C19138E2944Ffb72016c7;

    modifier isOwner(){
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
    //==restricts access to functions to only the contract owner.

    constructor(uint256 _coffeePrice) payable {
        owner = payable(msg.sender);
        coffeePrice = _coffeePrice * (10**18);
    }
    //==initializes contract owner and sets the price of a coffee.

    struct Coffee {
        address giver; // The address of the user who buys me a coffee.
        string message; // The message the user sent.
        string name; // The name of the user who buys me a coffee.
        uint256 timestamp; // The timestamp when the user buys me a coffee.
    }

    /*
     * I declare variable coffee that lets me store an array of structs.
     * This is what lets me hold all the coffee anyone ever sends to me!
     */
    Coffee[] coffee; //store all coffee transactions made thru the contract.

    /*
     * I added a function getAllCoffee which will return the struct array, coffee, to us.
     * This will make it easy to retrieve the coffee from our website!
     */
    function getAllCoffee() public view returns (Coffee[] memory) {
        return coffee;
    }

    // Get All coffee bought
    function getTotalCoffee() public view returns (uint256) {
        return totalCoffee;
    }
    //return total number of coffees bought

    // Get Coffee Amount
    function getCoffeeAmount() public view returns (uint256) {
        return coffeePrice;
    }

    function updateCoffeeAmount(uint _coffeePrice) public isOwner {
        require(_coffeePrice > 0, "Please enter a valid price");

        coffeePrice = _coffeePrice * (10**18);
    }

    function buyCoffee(
        string memory _message,
        string memory _name
    ) public payable {
        require(IERC20Token(cUsdTokenAddress).transferFrom(
                msg.sender,
                owner,
                coffeePrice),
            "Transfer failed"
        );

        totalCoffee += 1;

        /*
         * This is where I actually store the coffee data in the array.
         */
        coffee.push(Coffee(msg.sender, _message, _name, block.timestamp));
        
        emit NewCoffee(msg.sender, block.timestamp, _message, _name);
    }
}