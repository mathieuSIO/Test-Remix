pragma solidity 0.8.7;

//Les structures sont un peu comme des objets

//Vidéo Projet : Un wallet simple
contract test {

    //Que doit faire notre wallet?
    // -> Permettre d'avoir plusieurs adresse
    // -> Permettre d'envoyer de l'argent sur le contrat qui appartient à l'adresse 
    // -> Permettre de retirer de l'argent sur le contrat qui appartient à l'adresse 

    // -- 1 --
    //Je commence par défini la structure de mes wallets (ça correpondrai
    struct wallet {
        uint montant;
        uint nbDePayement; //Facultatif  
    }

    // -- 2 --
    //On permet qu'il y ait plusieurs wallet sur notre contrat
    mapping (address => wallet) Wallets;

    // -- 4 -- 
    //On veut pouvoir consulter le total d'argent sur le wallet
    function getTotalArgent() external view returns(uint){
        return address(this).balance; //balance est un attribut interne aux adresses
    }

    // -- 5 --
    //On veut pouvoir consulter le solde pour l'adresse qui la demande
    function getArgent() external view returns(uint){
        return Wallets[msg.sender].montant;
    }

    // -- 6 -- 
    //On veut pouvoir transferer de l'argent du wallet à l'adresse qui fait la demande
    function trasfer(address payable _to) public {
        uint _amount = Wallets[msg.sender].montant;
        _to.transfer(_amount);
        Wallets[msg.sender].montant = 0;
    }


    // -- 3 --
    //On veut que notre contrat puisse recevoir des transactions
    receive() external payable {
        Wallets[msg.sender].montant += msg.value;
        Wallets[msg.sender].nbDePayement++;
    }













    //Correction Ben BK

    // struct wallet {
    //     uint balance;
    //     uint nbPayements;
    // }

    // mapping (address => wallet) Wallets;

    // function getTotalMontant() public view returns(uint){
    //     return address(this).balance;
    // }

    // function getMontant() public view returns(uint){
    //     return Wallets[msg.sender].balance;
    // }

    // function withdrawAllMoney(address payable _to) public  {
    //     uint _amount = Wallets[msg.sender].balance;
    //     Wallets[msg.sender].balance = 0;
    //     _to.transfer(_amount);
    // }

    // receive() external payable{
    //     Wallets[msg.sender].balance += msg.value;
    //     Wallets[msg.sender].nbPayements++;
    // }

    
}
