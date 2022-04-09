//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract DAOCurrency is IERC20, IBounty {
//unsure if i need to instantiante IERC20 since IBounty already pulls from it, I would think not


// variables



// events


 /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256){
        require(account != address(0), "invalid address");
        uint256 balance = getBalance(account);
        return balance;

    }

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool){
        require(to != address(0), "invalid address");
        require(from = msg.sender, "sender is not the owner");
        require(amount > 0, "amount must be greater than 0");
        require(amount <= balanceOf(msg.sender), "insufficient balance");

        uint256 balance = makeMoves(msg.sender, to, amount);
        emit Transfer(msg.sender, to, balance);

    }

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256){
        
        require(owner != address(0), "invalid address");
        require(spender != address(0), "invalid address");
        uint256 allowance = getAllowance(owner, spender);
        return allowance;

    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool){

        require(spender != address(0), "invalid address");
        require(from = msg.sender, "sender is not the owner");
        require(amount > 0, "amount must be greater than 0");

        uint256 allowance = setAllowance(msg.sender, spender, amount);
        emit Approval(msg.sender, spender, allowance);


    }

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);


//constructor

// modifiers

// non-interface functions

    function getBalance(address account) internal view returns (uint256){
        uint balance = balances[account];
        return balance;
    }

   function getMyBalance(address account) internal view returns (uint256){
     require(account != address(0), "Not your address");
        uint balance = balances[account];
        return balance;
    }

    function makeMoves (address from, address to, uint256 amount) internal returns (uint256){
        balances[from] = balances[from].sub(amount);
        balances[to] = balances[to].add(amount);
        return balances[from];
    }



// ALLOWANCE FUNCTIONS 
    function getAllowance(address owner, address spender) internal view returns (uint256){
        require(owner != address(0), "invalid address");
        require(spender != address(0), "invalid address");
        uint256 allowance = allowances[owner][spender];
        return allowance;
    }

    function setAllowance(address owner, address spender, uint256 amount) internal returns (uint256){
        require(owner != address(0), "invalid address");
        require(spender != address(0), "invalid address");
        allowances[owner][spender] = amount;
        return allowances[owner][spender];
    }
 


} 