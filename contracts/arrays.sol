pragma solidity 0.8.7;

//Il y a deux possibilités pour stocker les variables en solidity
//Storage : C'est par défaut, directement dans la blockchain
//Memory : Pas stocké dans la blockchain, uniquement dans la fonction
// Déclaration de tableau : type[] nomTableau

//Vidéo 8 : Les arrays
contract Arrays {
    uint[] nombre;

    function addValue(uint _valeur) public {
        nombre.push(_valeur);
    }

    function updateValue(uint _index, uint _newVal) public {
        nombre[_index] = _newVal;
    }

    function deleteValue(uint _index) public {
        delete nombre[_index];
    }

    function getValue(uint _index) public view returns(uint){
        return nombre[_index];
    }

   
    function getNbx2() public view returns (uint[] memory){
        uint longueur = nombre.length;
        uint[] memory  nbx2 = new uint[](longueur) ;
        for (uint i  = 0; i < longueur; i++){
            nbx2[i] = nombre[i] * 2;
        }
        return nbx2;
    }
}

