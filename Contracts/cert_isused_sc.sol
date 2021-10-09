pragma solidity ^0.8.1;


contract cert_isused_sc{
    
    mapping(bytes32 => bool) cert_Status;
    
 //   address cert_vr_sc_address=0xCF64b74efbfC345eA574A35a87f4d1da4618AC43;  // Address of Cert_ZK_Proof.sol
       
    address Authority_Address=0x6E819b34c53Dc81400D95ab87BFdBE3Ae80E2EA2;
    
    mapping(address => bool) legal_SC;
    
  function legal_IDP_register(address legal_SC_Addr) public {     
        require ( msg.sender==Authority_Address,"Your identity is illegal");
            legal_SC[legal_SC_Addr]=true;
          
        }
         
    
   function set_cert_isused_sc_Status(bytes32 Hash_P) public {
        
        require (legal_SC[msg.sender]==true,"Your identity is illegal");
            cert_Status[Hash_P]=true;
               
        }

       
    function  read_Status(bytes32 Hash_P) public returns(bool){
        
        require (legal_SC[msg.sender]==true,"Your identity is illegal");
           return cert_Status[Hash_P];
        
        }       
       
       
        
    }
