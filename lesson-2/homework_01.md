⭐ Restaurant Rating Contract

Build a smart contract where the owner adds a list of restaurants.
Users can submit a rating only (1–5) for a restaurant.

Rules:
Only the owner can add restaurant names
Only added restaurants can receive ratings
Each user can rate each restaurant only once

Functions:
addRestaurant(restaurantName)
rateRestaurant(restaurantName, rating)
getAverageRating(restaurantName) → returns the average rating


contract RestaurantsRating {
    struct Restaurant {
        string name;
        uint16 rating;
        uint16 numberOfRatings;
        bool exists;
    }

    address ownerAddress;
    mapping(string => Restaurant) public restaurants;
    mapping(address => Restaurant) public userRestaurants;

    constructor() {
        ownerAddress = msg.sender;
        
    }

    modifier onlyOwner {
        require(msg.sender == ownerAddress, "Only Admin can do this action");
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

    function addRestaurant(string calldata restaurantName) public onlyOwner {
        restaurants[restaurantName] = Restaurant(restaurantName, 0, 0, true);
    }

    function rateRestaurant(string calldata restaurantName, uint16 _rate) public onlyInRange(_rate) onlyRateOnce {
        restaurants[restaurantName].rating = _rate;
        restaurants[restaurantName].numberOfRatings += 1;
        userRestaurants[msg.sender] = restaurants[restaurantName];
    }

    function getAverageRating(string calldata restaurantName) public view returns (uint16) {
        return restaurants[restaurantName].rating / restaurants[restaurantName].numberOfRatings;
    }

}