// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract product {
    uint256 productCount;

    struct productItem {
        uint256 productId;
        bytes32 productSN;
        bytes32 productName;
        bytes32 productBrand;
        bytes32 productPrice;
        bytes32 productStatus;
    }

    mapping(uint256 => productItem) public productItems;

    function addProduct(
        //bytes32 _manufactuerID,
        bytes32 _productName,
        bytes32 _productSN,
        bytes32 _productBrand,
        bytes32 _productPrice
    ) public {
        productItems[productCount] = productItem(
            productCount,
            _productSN,
            _productName,
            _productBrand,
            _productPrice,
           "Available"
        );
       
        productCount++;

    }
}
