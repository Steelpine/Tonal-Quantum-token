// solhint-disable
pragma solidity ^0.4.19;


contract TonalQuantum {
string public name = "Tonal Quantum Token";
    string public symbol = "TOQ";
    uint8 public decimals = 18;
    uint public INITIAL_SUPPLY = 300000000 * (10**uint256(decimals));
    uint256 public unitsOneEthCanBuy;
    uint256 public totalEthInWei;
    address public fundsWallet;

    event Bless(address indexed from, string words, uint256 value);
    event LogBuy(address user, uint amount);

    function TonalQuantum() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
        unitsOneEthCanBuy = 20000;
        fundsWallet = msg.sender;
    }

    function buy() payable public returns (bool) {
        totalEthInWei = totalEthInWei + msg.value;
        uint256 amount = msg.value * unitsOneEthCanBuy;
        require(balances[fundsWallet] >= amount);

        balances[fundsWallet] = balances[fundsWallet] - amount;
        balances[msg.sender] = balances[msg.sender] + amount;

        Transfer(fundsWallet, msg.sender, amount); // Broadcast a message to the blockchain

        //Transfer ether to fundsWallet
        fundsWallet.transfer(msg.value);                               
    }


    function bless(string _words, uint256 _value) public returns (bool) {
        require(_value >= bytes(_words).length);
        require(_value <= balances[msg.sender]);

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[owner] = balances[owner].add(_value);
        Bless(msg.sender, _words,  _value);

        return true;
    }

    function reclaimEther() onlyOwner public {
        assert(owner.send(address(this).balance));
    }

    function() payable public {
        buy();
    }
}
