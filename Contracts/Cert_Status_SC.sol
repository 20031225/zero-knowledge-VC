pragma solidity ^0.8.1;

contract Cert_Status_SC{
       
     mapping(address => bool) legal_IDP;  
       
    mapping(bytes32 => bool) Cert_Status;
     
    mapping(bytes32 => bytes32) Ethereum_Hash_2_ZoKrates_Hash;
        
 //IDP_Address=0x6E819b34c53Dc81400D95ab87BFdBE3Ae80E2EA2   
 
//cert_Ethereum_Hash=0x3d903698a1337cd13e37a43671352b865e495d214a7df21aa00ed11b5cf9837c

//Ethereum_signature=0x202b28672ae94adda39a495d138c8cb56807963d843785dae83a21dde8473cd4276bfb67f42b310c7579f9ad07f5768ae6a3325657ba7f8e20ddb9fe449478bf1b

//cert_ZoKrates_Hash=0x31f1904100000000d1b06df10000000027e42fac00000000b227f24b00000000


address  Authority_Address=0x6E819b34c53Dc81400D95ab87BFdBE3Ae80E2EA2;
     
       function legal_IDP_register(address IDP_DID) public {
        
        require ( msg.sender==Authority_Address,"Your identity is illegal");
            legal_IDP[IDP_DID]=true;
        
        
        }

    
    address account_address=0x6E819b34c53Dc81400D95ab87BFdBE3Ae80E2EA2;  //IDP Ether Account Address
    
   function Set_Status_Active(bytes32 Sign_H) public {
        
        require ( legal_IDP[msg.sender]==true,"Your identity is illegal");
            Cert_Status[Sign_H]=true;               
        }

   function  Set_Status_Revocation(bytes32 Sign_H) public {    
        require (legal_IDP[msg.sender]==true,"Your identity is illegal");
            Cert_Status[Sign_H]=false;  
        }       
            
    function  read_Status(bytes32 Sign_H) public view returns(bool){          
           return Cert_Status[Sign_H];        
        }       
       
 ///////////////////////////////////////////////////////////////////  
 ///////////////////////////////////////////////////////////////////    
      function Set_Ethereum_Hash_2_ZoKrates_Hash(bytes32 Ethereum_Hash,bytes32 ZoKrates_Hash) public {
        
        require (msg.sender == account_address,"Your identity is illegal");
           Ethereum_Hash_2_ZoKrates_Hash[ZoKrates_Hash]=Ethereum_Hash;          
        }
               
    function  read_Ethereum_Hash_2_ZoKrates_Hash(bytes32 ZoKrates_Hash) public view returns(bytes32){      
           return Ethereum_Hash_2_ZoKrates_Hash[ZoKrates_Hash];
        
        }        
                         
    }
    
    
    
