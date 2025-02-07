object "StoreYul" {
    code {
        // Contract Deployment
        datacopy(0, dataoffset("runtime"), datasize("runtime"))
        return(0, datasize("runtime"))
    }
    
    object "runtime" {
        code {
            // Function dispatcher
            switch selector()
            // updateNumberOfItems(uint256)
            case 0xa9d68806 {
                // Do some stuff
                storeNumber(decodeAsUnit(0))
            }
            // getNumberOfItems()
            case 0x730ef269 {
                // Read number
                returnUint(readNumber())
            }
            default {
                revert(0, 0)
            }
            
            function storeNumber(_newNumber) {
                // Store number
                sstore(0, _newNumber)
            }
            
            function readNumber() -> result {
                result := sload(0)
            }

            /****---- Decoding functions ----****/
            function selector() -> s {
                s := div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
            }
            
            function decodeAsUnit(offset) -> v {
                let positionIncalldata := add(4, mul(offset, 0x20)) // Adding 4 which is the function selector
                if lt(calldatasize(), add(positionIncalldata, 0x20)) {
                    revert(0, 0)
                }
                v := calldataload(positionIncalldata)
            }
            
            function returnUint(v) {
                mstore(0, v)
                return(0, 0x20)
            }
        }
    }
}
