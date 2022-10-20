pragma solidity 0.8.7;

//En solidity priviligier les maps aux tableaux car les tableaux coutent cher en gaz

//Vidéo sur le mapping
contract test {
    mapping(address => uint) Balances;

    //On récupere la balance d'un compte donné sur notre contrat
    function getBalance(address _monAddress) public view returns(uint _balance) {
        return Balances[_monAddress];
    }

    receive() external payable{
        //Nous permet d'associer un montant à une adresse
        Balances[msg.sender] = msg.value;
    }

}
