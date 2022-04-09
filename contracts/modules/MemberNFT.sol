// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "../utils/IERC165.sol";
import "../tokens/IERC721.sol"; 


contract memberNFT is IMember, IERC721, IERC165 {
// OpenZeppelin Contracts v4.4.1 (token/ERC721/IERC721.sol)

////////////////////////////////////////////////////////////////////////////////
/* This contract will allow members to mint memberShips, they will only be able to mint and burn, yes it's a shitty erc-721 contract but it's a proof of concept */
////////////////////////////////////////////////////////////////////////////////



    // Variables 
    uint memberCount;
    uint public shipCost;


    struct Member{
        bool memberStatus;
        uint256 memberId;
        address memberAddress;
    }


    address constant zeroAdd = 0x0000000000000000000000000000000000000000;
    address immutable DAO;

    mapping (address => Member) members;

// Constructor

    constructor(address _orgAddress, uint _membershipCost) {
        DAO = _orgAddress;
        shipCost = _membershipCost; // not a constant so that this can be modified, again only by DAO 
    }


    /**
     * @dev Emitted when `tokenId` token is transferred from `from` to `to`.
     */
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables `approved` to manage the `tokenId` token.
     */
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);

    /**
     * @dev Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.
     */
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    

    /**
     * @dev Returns the number of tokens in ``owner``'s account.
     */
    function balanceOf(address owner) external view returns (uint256 balance){
        // limited to 1 member NFT per wallet 
        // if owner is not the wallet address, required
        // if the owner has no NFTs, return 0
        // require address^ to be a member of the DAO 
        uint256 balance = owner[memberShips];
        // possible gas optimization if we revert if the address has addressIsMember == false; as opposed to checking whether the user owns this NFT
        return balance;

    }



    /**
     * @dev Returns the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */
    function ownerOf(uint256 tokenId) external view returns (address owner){

        // returns the address of the owner of the NFT
        //no checks, straightforward 
        return tokenId[owner]; // need to set this in in the minting of tokens 

    }

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must exist and be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     * - If `to` refers to a smart contract, it must implement {IERC721Receiver-onERC721Received}, which is called upon a safe transfer.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(
        address from, address to, uint256 tokenId, bytes calldata data) external {

            // require non-zero address as to and from, require tokenId to be non-zero, require from to be the owner of the tokenId;
            // transfer the tokenId to the to address
            // oh duh, rever this because no transfers. Destroy or nothing. Possible no returning to the dao if we don't reset the wallet address after a destroy and we don't make the true to a false. 
            
            // if the to address is a contract, call the onERC721Received function on the contract BUT THAT WON"T HAPPEN RIGHT??!?!! 

        }

    

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * WARNING: Usage of this method is discouraged, use {safeTransferFrom} whenever possible.
     *
     * Requirements:
     *
     * - `from` cannot be the zero address.
     * - `to` cannot be the zero address.
     * - `tokenId` token must be owned by `from`.
     * - If the caller is not `from`, it must be approved to move this token by either {approve} or {setApprovalForAll}.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external{

        revert, "transferFrom is not supported";
    }

    /**
     * @dev Gives permission to `to` to transfer `tokenId` token to another account.
     * The approval is cleared when the token is transferred.
     *
     * Only a single account can be approved at a time, so approving the zero address clears previous approvals.
     *
     * Requirements:
     *
     * - The caller must own the token or be an approved operator.
     * - `tokenId` must exist.
     *
     * Emits an {Approval} event.
     */
    function approve(address to, uint256 tokenId) external{

        // revert
        // no delegation of memberShips transfers allowed
    }

    /**
     * @dev Approve or remove `operator` as an operator for the caller.
     * Operators can call {transferFrom} or {safeTransferFrom} for any token owned by the caller.
     *
     * Requirements:
     *
     * - The `operator` cannot be the caller.
     *
     * Emits an {ApprovalForAll} event.
     */
    function setApprovalForAll(address operator, bool _approved) external{
        // Ideally set in the constructor. but can't use outside of constructor. This is a conundrum not really just not something I'm going to use after.
        // maybe an init function to set fields after construction, otherwise will have to take out the init function. 
        revert, "setApprovalForAll is not supported, only DAO can have approval for all";
        // count to 1 so that this can not be set after setting to the DAO address.
    }
    /**
     * @dev Returns the account approved for `tokenId` token.
     *
     * Requirements:
     * - `tokenId` must exist.
     */
    function getApproved(uint256 tokenId) external view returns (address operator){
        // this should only be the owner of the token calling that. if that's even a thing. 
        return DAO;
    }



    /**
     * @dev Returns if the `operator` is allowed to manage all of the assets of `owner`.
     *
     * See {setApprovalForAll}
     */
    function isApprovedForAll(address owner, address operator) external view returns (bool){
        // this is the DAO address, so it can do anything, but that's the only one that can. 
        return DAO;
    }

    // additional functions 

    /**
     * @dev Returns the address of the owner of the `tokenId` token.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
     */

    function mint(address to, uint256 tokenId) external { 
        require(msg.sender.memStatus == false);
        tokenCount++;
        safeTransfer(msg.sender, to, tokenId);
        // safetransfer from the zero-address
        // this is the only way to mint NFTs.
        // only one allowed per wallet.
        // set to true
        // set max count of NFTS in constructor to limit group and count down upon burn of NFT. 
        // if there's a cost, that should be set in the constructor. 
        
    }


    function burn(uint256 tokenId) external {

        // this is the only way to burn NFTs.
        transferFrom(msg.sender, zeroAdd, uint tokenId);
        memberCount--
        // transfer from msg.sender maybe need a function to burn the nft from the DAO's address(removing members,forget what that is called, somethign like suicide or flame out...it's ragequit )
    }   

    function daoBurn(address memberAdd, uint256 tokenID) external {
        //this will be performed by the DAO contract, so the DAO address should probably be established during construction. 
        // this is the only way to burn NFTs.
        memberCount--;
        transferFrom(memberAdd, zeroAdd, uint tokenId);
        // count down to account for member change
    }


}
