// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/SupplyChain.sol";

contract TestSupplyChain {
    function testAddItem() public {
        string memory name;
        uint sku;
        uint price;
        uint state;
        address seller;
        address buyer;

        SupplyChain supplyChain = SupplyChain(DeployedAddresses.SupplyChain());

        // Adds 1st Item
        supplyChain.addItem('Item 1', 0);

        // Fetchs 1st Item and Asserts that is ForSale
        (name, sku, price, state, seller, buyer) = supplyChain.fetchItem(0);

        Assert.equal(state, 0, "State should be ForSale or 0");
    }
}