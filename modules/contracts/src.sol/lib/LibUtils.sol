// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.1;
pragma experimental ABIEncoderV2;


library LibUtils {

    function min(uint256 x, uint256 y) internal pure returns (uint256) {
        return x <= y ? x : y;
    }

    function max(uint256 x, uint256 y) internal pure returns (uint256) {
        return x <= y ? y : x;
    }

    // If success is false, reverts and passes on the revert string.
    function revertIfCallFailed(bool success, bytes memory returnData)
        internal
        pure
    {
        if (!success) {
            assembly {
                revert(add(returnData, 0x20), mload(returnData))
            }
        }
    }

}
