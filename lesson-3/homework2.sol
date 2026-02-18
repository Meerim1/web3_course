// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; 

//
Task 2: Crowdfunding with Voting & HelloWorld Function
1. Refactor your crowdfunding contract to include a HelloWorld function.
2. The HelloWorld function can be enabled or disabled based on votes from contributors.
3. Each address that contributed has one vote, regardless of how many times they funded or how much they contributed.
4. Each contributor can vote to disable or enable the HelloWorld function.
5. Votes can be changed (from true to false or vice versa), but each address can vote only once at a time.
6. Include functions to cast votes and tally votes to determine whether HelloWorld is active.
Suggested function names:
• helloWorld () - prints a message if enabled.
• voteToDisable(bool vote) - cast or update your vote.
• getVote(address voter) - check an address's vote.
• tallyVotes () - calculate current votes and determine HelloWorld status.
• VotingUpdated (address voter, bool vote) - event emitted when someone votes.
Concepts to practice: payable, events, mappings/structs for voting, conditional function execution.
//

contract CrowdfundingWithVotes {
    struct Contributor {
        bool hasVoted;
        bool vote;
        uint donats;
    }

    bool helloWorldEnabled;
    mapping(address => Contributor) contributorsByAddress;
    address[] public contributorList;
    uint256 minAmount;

    constructor() {
        minAmount = 0.5 ether;
        helloWorldEnabled = false;
    }

    event FundingReceived (address indexed contributor, uint256 amount);
    event VotingUpdated (address voter, bool vote);
    event MessagePrinted(string text);
    error CanVoteOnlyOnce();


    modifier onlyMoreThanMin() {
        require(msg.value >= minAmount, 'Must sent at least 0.5 ETH');
        _;
    }

    modifier onlyWhenEnabled() {
        require(helloWorldEnabled == true, 'HelloWorld must be enabled');
        _;
    }

    modifier onlyContributor() {
        require(contributorsByAddress[msg.sender] != 0, 'Must be a contributor')
    }

    function fund() payable external onlyMoreThanMin {
        if(contributorsByAddress[msg.sender] == 0) {
            contributorList.push(msg.sender);
        }
        contributorsByAddress[msg.sender].donats += msg.value;
        emit FundingReceived(msg.sender, msg.value);
    }

    function getContributors() public view returns (address[] memory) {
        return contributorList;
    }

    function voteToDisable(bool calldata vote) external onlyContributor {
        if(contributorsByAddress[msg.sender].hasVoted == true) {
            revert CanVoteOnlyOnce();
        }  
        contributorsByAddress[mgs.sender].hasVoted = true;
        contributorsByAddress[mgs.sender].vote = vote;   
        VotingUpdated(msg.senderm, vote);
    }

    function getVote(address calldata _voterAddress) public returns (bool){
        return contributorsByAddress[_voterAddress].vote;
    }

    function tallyVotes() {
        int votesToEnable;
        int votesToDisable;
        for(int i = 0; i < contributorList.length; i++) {
            Contributor currentContributor = contributorsByAddress[contributorList[i]]
            if(currentContributor.vote == true) {
                votesToEnable +=1;
            }
            if(currentContributor.vote == false) {
                votesToDisable +=1;
            }
        }

        helloWorldEnabled = votesToEnable > votesToDisable;
    }

    function helloWorld() external onlyWhenEnabled {
        emit MessagePrinted('Hello World');
    }
}