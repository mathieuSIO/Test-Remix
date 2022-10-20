pragma solidity 0.8.7;

//finney, Gwei et Wei sont des sous unité d'ether

//Contrat de test de la vidéo Envoyer de l'ether sur un contrat msg.sender, msg.value
contract test {

    address lastPerson; //La derniere  personne qui a envoyé de l'argent sur le smart contract
    uint balance; //Montant envoyé sur le smart contract

    function getLastPeron() public view returns(address){
        return lastPerson;
    }

    function getBalance() public view returns(uint) {
        return balance;
    }


    //Permet d'envoyer de l'argent sur le smart contract
    //Il ne peut y avoir qu'une seul fonction recieve par contrat 
    //payable indique qu'il va y avoir une variation d'argent
    receive() external payable {
        //Permet de recupérer la derniere personne qui a envoyé de l'argent
        lastPerson = msg.sender;
        
        //Permet de récupérer le montant en Wei envoyé par l'user
        balance = msg.value;
    }

}
