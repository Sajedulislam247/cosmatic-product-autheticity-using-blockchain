// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract product {
    uint256 productCount;
    uint256 sellerCount;

    struct productItem {
        uint256 productId;
        bytes32 productSN;
        bytes32 productName;
        bytes32 productBrand;
        bytes32 productPrice;
        bytes32 productStatus;
    }
    
    struct seller{
        uint256 sellerId;
        bytes32 sellerName;
        bytes32 sellerBrand;
        bytes32 sellerCode;
        uint256 sellerNum;
        bytes32 sellerManager;
        bytes32 sellerAddress;
    }

    mapping(uint256 => productItem) public productItems;
    mapping(uint=>seller) public sellers;

    function addProduct(
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
    
    function addSeller(
        bytes32 _sellerName, 
        bytes32 _sellerBrand, 
        bytes32 _sellerCode,
        uint256 _sellerNum, 
        bytes32 _sellerManager, 
        bytes32 _sellerAddress) 
    public{
        sellers[sellerCount] = seller(
            sellerCount, 
            _sellerName, 
            _sellerBrand,
            _sellerCode,
            _sellerNum, 
            _sellerManager, 
            _sellerAddress);

        sellerCount++;

    }
}
