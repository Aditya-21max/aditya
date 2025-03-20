pragma solidity ^0.8.0;

contract ZKPNFT {

    mapping(address => bool) private verifiedUsers;
    mapping(uint256 => address) private tokenOwners;

    uint256 private nextTokenId;

    event Mint(address indexed owner, uint256 tokenId);

    // Example function to verify user using ZKP (simulated)
    function verifyUser(address user) internal {
        verifiedUsers[user] = true;
    }

    // Function to mint NFT for verified users
    function mint() public {
        require(verifiedUsers[msg.sender], "User not verified");

        uint256 tokenId = nextTokenId;
        tokenOwners[tokenId] = msg.sender;
        nextTokenId++;

        emit Mint(msg.sender, tokenId);
    }

    // Function to check ownership
    function ownerOf(uint256 tokenId) public view returns (address) {
        require(tokenOwners[tokenId] != address(0), "Token does not exist");
        return tokenOwners[tokenId];
    }

    // Example function to simulate ZKP verification
    function simulateVerification() public {
        verifyUser(msg.sender);
    }
}
