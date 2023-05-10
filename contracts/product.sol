// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract product {
    uint256 sellerCount;
    uint256 productCount;

    struct seller {
        uint256 sellerId;
        bytes32 sellerName;
        bytes32 sellerBrand;
        bytes32 sellerCode;
        uint256 sellerNum;
        bytes32 sellerManager;
        bytes32 sellerAddress;
    }
    mapping(uint256 => seller) public sellers;

    struct productItem {
        uint256 productId;
        bytes32 productSN;
        bytes32 productName;
        bytes32 productBrand;
        uint256 productPrice;
        bytes32 productStatus;
    }

    mapping(uint256 => productItem) public productItems;



    //PRODUCT SECTION

    function addProduct(
        //bytes32 _manufactuerID,
        bytes32 _productName,
        bytes32 _productSN,
        bytes32 _productBrand,
        uint256 _productPrice
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

    function viewProductItems()
        public view returns 
        (
            uint256[] memory,
            bytes32[] memory,
            bytes32[] memory,
            bytes32[] memory,
            uint256[] memory,
            bytes32[] memory
        )
    {
        uint256[] memory pids = new uint256[](productCount);
        bytes32[] memory pSNs = new bytes32[](productCount);
        bytes32[] memory pnames = new bytes32[](productCount);
        bytes32[] memory pbrands = new bytes32[](productCount);
        uint256[] memory pprices = new uint256[](productCount);
        bytes32[] memory pstatus = new bytes32[](productCount);

        for (uint256 i = 0; i < productCount; i++) {
            pids[i] = productItems[i].productId;
            pSNs[i] = productItems[i].productSN;
            pnames[i] = productItems[i].productName;
            pbrands[i] = productItems[i].productBrand;
            pprices[i] = productItems[i].productPrice;
            pstatus[i] = productItems[i].productStatus;
        }
        return (pids, pSNs, pnames, pbrands, pprices, pstatus);
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
