### MATHS MASTER
 1. version compactibility -> ^0.8.3 -> does not allow custom errors
 2. mulWad-> mstore(0x40, 0xbac65e5b) // `MathMasters__MulWadFailed()`.  //will revert with blank message  //wrong function selector
                //fix mstore(0x00, 0xa56044f7)
                revert(0x1c, 0x04)
 3. mulWadUp  ->  mstore(0x40, 0xbac65e5b) // `MathMasters__MulWadFailed()`.   -> storing the error selector at the free memory address /Wrong selector
                //fix mstore(0x00,0xa56044f7)
