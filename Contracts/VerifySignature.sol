pragma solidity ^0.4.10;

contract VerifySignature{

 
  function verifyByHashAndSig(bytes32 Sign_H, bytes IDP_signature) public view returns (address){
    bytes memory signedString = IDP_signature;
    uint8 v;
    
    bytes32  r = bytesToBytes32(slice(signedString, 0, 32));
    bytes32  s = bytesToBytes32(slice(signedString, 32, 32));
    byte  v1 = slice(signedString, 64, 1)[0];
   // if(uint8(v1)<28){
    v = uint8(v1);//}
  //  else{
  //   v = uint8(v1); 
 //   }
    return ecrecoverDirect(Sign_H, r, s, v);
  }


  function slice(bytes memory data, uint start, uint len) returns (bytes){
    bytes memory b = new bytes(len);

    for(uint i = 0; i < len; i++){
      b[i] = data[i + start];
    }
    return b;
  }


  function bytesToBytes32(bytes memory source) returns (bytes32 result) {
    assembly {
        result := mload(add(source, 32))
    }
  }


  function ecrecoverDirect(bytes32 hash, bytes32 r, bytes32 s, uint8 v) returns (address addr){
     /* prefix might be needed for geth only
     * https://github.com/ethereum/go-ethereum/issues/3731
     */
     bytes memory prefix = "\x19Ethereum Signed Message:\n32";
     hash = sha3(prefix, hash);

     addr = ecrecover(hash, v, r, s);
  }
}
