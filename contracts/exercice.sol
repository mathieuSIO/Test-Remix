pragma solidity 0.8.7;

contract Exercice {

    enum etape {commande, expedie, livre}

    struct produit {
        uint _SKU;
        Exercice.etape _etape;
    }

    mapping (address => produit) CommandeClient;

    function commander(address _cli, uint _SKU) public {
        produit memory p = produit(_SKU, etape.commande);
        CommandeClient[_cli] = p;
    }

    function expedier(address _cli) public{
        CommandeClient[_cli]._etape = etape.expedie;
    }

    function getSKU(address _cli) public view returns(uint){
        return CommandeClient[_cli]._SKU;
    }

     function getEtape(address _cli) public view returns(etape){
        return CommandeClient[_cli]._etape;
    }

}