write contract that where we set strings
and another fucntion that count how many times that exact string occured

contract StringCounter {
    mapping(bytes32 => uint256) public stringsHash;

    function setString(string memory value) public {
        bytes32 hash = keccak256(bytes(value));
        uint256 currentCount = stringsHash[hash];
        stringsHash[hash] = currentCount + 1;
    }

    function getCount(string memory value) public returns (uint256) {
        bytes32 hash = keccak256(bytes(value));
        return stringsHash[hash];
    }
    
}