// SPDX-License-Identifier: Apache-2.0

/// @title ERC1155TLProxy.sol
/// @notice Transient Labs Core ERC1155 Contract Proxy
/// @author transientlabs.xyz

/*
    ____        _ __    __   ____  _ ________                     __ 
   / __ )__  __(_) /___/ /  / __ \(_) __/ __/__  ________  ____  / /_
  / __  / / / / / / __  /  / / / / / /_/ /_/ _ \/ ___/ _ \/ __ \/ __/
 / /_/ / /_/ / / / /_/ /  / /_/ / / __/ __/  __/ /  /  __/ / / / /__ 
/_____/\__,_/_/_/\__,_/  /_____/_/_/ /_/  \___/_/   \___/_/ /_/\__(_)*/

pragma solidity 0.8.17;

import {ERC1967Proxy} from "openzeppelin/proxy/ERC1967/ERC1967Proxy.sol";

/*//////////////////////////////////////////////////////////////////////////
                            ERC1155TLProxy
//////////////////////////////////////////////////////////////////////////*/

contract ERC1155TLProxy is ERC1967Proxy {
    
    /// @param name: the name of the 1155 contract
    /// @param defaultRoyaltyRecipient: the default address for royalty payments
    /// @param defaultRoyaltyPercentage: the default royalty percentage of basis points (out of 10,000)
    /// @param admins: array of admin addresses to add to the contract
    /// @param enableStory: a bool deciding whether to add story fuctionality or not
    /// @param blockListRegistry: address of the blocklist registry to use
    constructor(
        address implementation,
        string memory name,
        address defaultRoyaltyRecipient,
        uint256 defaultRoyaltyPercentage,
        address[] memory admins,
        bool enableStory,
        address blockListRegistry
    )
        ERC1967Proxy(
            implementation,
            abi.encodeWithSignature(
                "initialize(string,address,uint256,address,address[],bool,address)",
                name,
                defaultRoyaltyRecipient,
                defaultRoyaltyPercentage,
                msg.sender,
                admins,
                enableStory,
                blockListRegistry
            )
        )
    {}
}