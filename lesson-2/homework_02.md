⭐ Restaurant Review Contract — Extended Short Description (with Moderators)

Build a smart contract where the owner manages the system and can:
- Contract creatro can add moderators
- Moderators can propose new restaurants
- A restaurant is added only after two moderators approve it

The owner may also add restaurants directly (no approvals needed)
Users can submit one review per restaurant, consisting of A rating (1–5)

Rules:
Only approved restaurants can be reviewed
Each user can review each restaurant only once
Store all reviews on-chain
Provide getAverageRating(restaurantId) to return the average rating

contract SmartRestaurantReview {
    address ownerAddress;

    constructor() {
        ownerAddress = msg.sender;
    }

    struct Restaurant {
        string name;
        uint16 rate;
        uint16 numberOfRates;
        bool exist;
    }

    struct TempRestaurant {
        string name;
        uint16 approves;
    }

    struct Review {
        address userAddress;
        string restaurantName;
        uint16 rate;
    }

    mapping(string => Restaurant) restaurants;
    mapping(string => TempRestaurant) restaurantsOnHold;
    address[] moderators;
    mapping(address => Restaurant) public userRestaurants;
    Review[] reviewsHistory;

    modifier onlyOwner() {
        require(msg.sender == ownerAddress, 'Only owner can add moderators');
        _;
    }

    modifier onlyNewModeratorAddress(address _address) {
        bool exist = false;
        for(uint i = 0; i < moderators.length; i++) {
            if(moderators[i] == _address) {
                exist = true;
                break
            }
        }
        require(!exist, 'Moderator already exist');
        _;
    }

    modifier onlyModerator(address _address) {
        bool isMod = false;
        for(uint i = 0; i < moderators.length; i++){
            if(moderators[i] == _address) {
                isMod = true;
                break;
            }
        }
        require(isMod, 'Not a moderator');
        _;
    }

        modifier onlyInRange(uint16 _value) {
        require(_value >= 1 && _value <= 5, "Rate must be between 1 and 5");
        _;
    }

    modifier onlyRateOnce {
        require(userRestaurants[msg.sender].rating == 0, "User can rate only once");    
        _;
    }

    modifier onlyExistRestaurant(string calldata _name) {
        require(restaurants[_name].exists, 'Restaurant not found');
        _;
    }

    function addModerators(address calldata _address) public onlyOwner onlyNewModeratorAddress(_address) {
        moderators.push(_address);
    }

    function proposeRestaurant(string calldata _restaurantName) public onlyModerator {
        restaurantsOnHold[_restaurantName].name = _restaurantName;
    }

    function approveRestaurant(string calldata _restaurantName) public onlyModerator {
        restaurantsOnHold[_restaurantName].approves += 1;

        if(restaurantsOnHold[_restaurantName].approves > 2) {
            restaurants[_restaurantName] = Restaurant(_restaurantName, 0, 0, true);
        }
    }

    function addRestaurant(string calldata _restaurantName) public onlyOwner {
        restaurants[_restaurantName] = Restaurant(_restaurantName, 0, 0, true);
    }

    function rateRestaurant(string calldata restaurantName, uint16 _rate) public onlyInRange(_rate) onlyRateOnce {
        restaurants[restaurantName].rating = _rate;
        restaurants[restaurantName].numberOfRatings += 1;
        userRestaurants[msg.sender] = restaurants[restaurantName];
        reviewsHistory.push(Review(msg.sender, restaurantName, _rate));
    }

    function getAverageRating(string calldata restaurantName) public view returns (uint16) {
        return restaurants[restaurantName].rating / restaurants[restaurantName].numberOfRatings;
    }
}