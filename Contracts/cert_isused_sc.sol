pragma solidity ^0.8.1;


contract cert_isused_sc{
    
    mapping(bytes32 => bool) cert_Status;
    
    address cert_vr_sc_address=0xCF64b74efbfC345eA574A35a87f4d1da4618AC43;  // Address of Cert_ZK_Proof.sol
    
   function set_cert_isused_sc_Status(bytes32 Hash_P) public {
        
        require (msg.sender == cert_vr_sc_address,"Your identity is illegal");
            cert_Status[Hash_P]=true;
        
        
        }

       
    function  read_Status(bytes32 Hash_P) public returns(bool){
        
        require (msg.sender == cert_vr_sc_address,"Your identity is illegal");
           return cert_Status[Hash_P];
        
        }       
       
       
        
    }
