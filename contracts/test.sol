pragma solidity 0.8.7;

//Les structures sont un peu comme des objets

//Vidéo sur les structures
contract test {

    struct balance {
        uint money;
        uint nbPayement;
    }

    mapping(address => balance) Balances;

    //On récupere la balance de la personne qui appele la fonction
    function getBalance() public view returns(uint){
        return Balances[msg.sender].money;
    } 

    //function qui permet de récuperer le nombre de paiement
    function getNbPayement() public view returns(uint) {
        return Balances[msg.sender].nbPayement;
    }

    receive() external payable {
        Balances[msg.sender].money += msg.value;
        Balances[msg.sender].nbPayement++;
    }

    
}
