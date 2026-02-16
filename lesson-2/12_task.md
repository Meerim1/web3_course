Create a smart contract that assigns an admin at deployment and allows the admin to pause or unpause the contract.
When the contract is paused, function execution is restricted.
The contract should have a function that returns "Hello World", and this function can only be executed when the contract is not paused.

contract SmartContract {
    bool isPaused public;
    address admin public;

    constractor() {
        owner = msg.sender;
        isPaused = false;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Not Admin");
        _;
    }

    modifier onlyWhenNotPaused () {
        require(isPaused == false, "Contract is paused");
        _;
    }

    function togglePause() public onlyAdmin {
        isPaused = !isPaused;
    }

    function printHelloWorld() public onlyWhenNotPaused {
        return 'Hello World';
    }
}