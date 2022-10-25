pragma solidity 0.8.7;

//Vidéo 11 : Les structures de contrôle
contract Exercice {

    uint nombre;

    function setNombre(uint _nb) public{
        //Necessite la condidition pour continuer la fonction sin rend les gas pas utilisé
        require(_nb != 10, "Le nombre ne peut pas etre egal a 10");
        nombre = _nb;
    }

    function getNombre() public view returns(uint){
        return nombre;
    }




}