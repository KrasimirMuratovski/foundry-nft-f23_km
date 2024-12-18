//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721 {// will represent a collection of dogies each with unique id
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;
    constructor() ERC721("Dogie", "DOG") {
        s_tokenCounter = 0;
    }


/// ERC271 buitl in:
                // function _safeMint(address to, uint256 tokenId) internal {
                //         _safeMint(to, tokenId, "");
                //     }
    function mintNft(string memory  tokenUri) public{
        s_tokenIdToUri[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;


    }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }   
}