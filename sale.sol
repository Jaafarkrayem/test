/**
 *Submitted for verification at polygonscan.com on 2024-06-20
*/

// File: @openzeppelin/contracts/utils/Context.sol


// OpenZeppelin Contracts (last updated v5.0.1) (utils/Context.sol)

pragma solidity ^0.8.20;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual returns (uint256) {
        return 0;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol


// OpenZeppelin Contracts (last updated v5.0.0) (access/Ownable.sol)

pragma solidity ^0.8.20;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * The initial owner is set to the address provided by the deployer. This can
 * later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    /**
     * @dev The caller account is not authorized to perform an operation.
     */
    error OwnableUnauthorizedAccount(address account);

    /**
     * @dev The owner is not a valid owner account. (eg. `address(0)`)
     */
    error OwnableInvalidOwner(address owner);

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */
    constructor(address initialOwner) {
        if (initialOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(initialOwner);
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        if (owner() != _msgSender()) {
            revert OwnableUnauthorizedAccount(_msgSender());
        }
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby disabling any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        if (newOwner == address(0)) {
            revert OwnableInvalidOwner(address(0));
        }
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.20;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
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
     * @dev Returns the value of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the value of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves a `value` amount of tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 value) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets a `value` amount of tokens as the allowance of `spender` over the
     * caller's tokens.
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
    function approve(address spender, uint256 value) external returns (bool);

    /**
     * @dev Moves a `value` amount of tokens from `from` to `to` using the
     * allowance mechanism. `value` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 value) external returns (bool);
}

// File: @openzeppelin/contracts/utils/math/SafeMath.sol


// OpenZeppelin Contracts (last updated v4.9.0) (utils/math/SafeMath.sol)

pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: @chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol


pragma solidity ^0.8.0;

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

// File: contracts/DNRsale_final.sol



pragma solidity 0.8.26;





/**
 * @title DNRSale
 * @dev A token sale contract for DNR tokens, accepting payments in USDT and Matic.
 */
contract DNRSale is Ownable {
    using SafeMath for uint256;

    // State variables
    address public DNRToken;
    uint256 public price = 7 * 1e16; // 0.07 USDT per token
    bool public saleActive = true; // Status of the token sale
    uint256 public totalInvestmentUSDT = 0; // Total USDT invested
    uint256 public totalInvestmentMatic = 0; // Total Matic invested
    uint256 public tokenSold = 0; // Total tokens sold

    // Instances of ERC20 tokens for USDT and DNR
    IERC20 public usdt = IERC20(0xc2132D05D31c914a87C6611C10748AEb04B58e8F); // USDT token address on Polygon
    IERC20 public dnr = IERC20(0x8a6ad635B6763C95299C4bc5E817F5c3d81947B4); // DNR token address

    // Chainlink MATIC/USD price feed
    AggregatorV3Interface internal priceFeed = AggregatorV3Interface(0xAB594600376Ec9fD91F8e885dADF0CE036862dE0);

    // Mappings for investments and affiliate tracking
    mapping(address => uint256) public usdtInvestment; // Tracks USDT investments by address
    mapping(address => uint256) public maticInvestment; // Tracks Matic investments by address
    mapping(address => bool) public specialAffiliate; // Tracks special affiliate addresses
    mapping(address => bool) public influencerAffiliate; // Tracks influencer affiliate addresses
    mapping(address => uint256) public affiliateEarningUSDT; // Tracks affiliate earnings in USDT
    mapping(address => uint256) public affiliateEarningMatic; // Tracks affiliate earnings in Matic

    // Events
    event TokensPurchasedWithUSDT(address indexed purchaser, uint256 amount);
    event TokensPurchasedWithMatic(address indexed purchaser, uint256 amount);
    event AffiliateSet(
        address indexed affiliate,
        bool isSpecial,
        bool isInfluencer
    );
    event AffiliateRemoved(
        address indexed affiliate,
        bool isSpecial,
        bool isInfluencer
    );
    event SaleStarted();
    event SaleStopped();
    event FundsForwarded();
    event RemainingTokensWithdrawn();

    /**
     * @dev Initializes the contract by setting the owner.
     */
    constructor() Ownable(msg.sender) {}

    /**
     * @dev Sets a special affiliate address. Only callable by the owner.
     * @param add The address to be set as a special affiliate.
     */
    function setSpecialAffiliate(address add) public onlyOwner {
        specialAffiliate[add] = true;
        emit AffiliateSet(add, true, false);
    }

    /**
     * @dev Sets an influencer affiliate address. Only callable by the owner.
     * @param add The address to be set as an influencer affiliate.
     */
    function setInfluencerAffiliate(address add) public onlyOwner {
        influencerAffiliate[add] = true;
        emit AffiliateSet(add, false, true);
    }

    /**
     * @dev Removes a special affiliate address. Only callable by the owner.
     * @param add The address to be removed from special affiliates.
     */
    function removeSpecialAffiliate(address add) public onlyOwner {
        specialAffiliate[add] = false;
        emit AffiliateRemoved(add, true, false);
    }

    /**
     * @dev Removes an influencer affiliate address. Only callable by the owner.
     * @param add The address to be removed from influencer affiliates.
     */
    function removeInfluencerAffiliate(address add) public onlyOwner {
        influencerAffiliate[add] = false;
        emit AffiliateRemoved(add, false, true);
    }

    /**
     * @dev Updates the price of 1 Matic in USDT using Chainlink price feed.
     */
    function getOneMaticPrice() public view returns(uint256){
        (, int256 _price,,,) = priceFeed.latestRoundData();
        require(price > 0, "Invalid price");
        return uint256(_price);
    }

    /**
     * @dev Gets the current token price based on the number of tokens sold.
     * @return The current price of the token.
     */
    function getTokenCurrentPrice() public view returns (uint256) {
        if (tokenSold < 2_000_000 * 1e18) {
            return 7 * 1e16;
        } else if (
            tokenSold >= 2_000_000 * 1e18 && tokenSold < 4_000_000 * 1e18
        ) {
            return 75 * 1e15;
        } else {
            return 75 * 1e15;
        }
    }

    /**
     * @dev Fallback function to revert any direct ether transfers.
     */
    fallback() external payable {
        revert("Fallback function not allowed");
    }

    /**
     * @dev Receive function to handle incoming ether.
     */
    receive() external payable {}

    /**
     * @dev Internal function to handle referral commissions.
     * @param ref The address of the referrer.
     * @param amount The amount used for calculating the commission.
     * @param payMode The mode of payment (1 for USDT, 2 for Matic).
     */
    function referral(
        address ref,
        uint256 amount,
        uint256 payMode
    ) internal {
        uint256 comm;

        if (specialAffiliate[ref]) {
            comm = amount / 20; // 5 percent
        } else if (influencerAffiliate[ref]) {
            comm = amount / 10; // 10 percent
        } else {
            comm = amount / 33; // ~3 percent
        }

        if (payMode == 1) {
            affiliateEarningUSDT[ref] = affiliateEarningUSDT[ref].add(comm);
            usdt.transfer(ref, comm);
        } else {
            affiliateEarningMatic[ref] = affiliateEarningMatic[ref].add(comm);
            payable(ref).transfer(comm);
        }
    }

    /**
     * @dev Function to purchase tokens using USDT. Handles referral commissions if applicable.
     * @param affi The address of the referrer.
     * @param amount The amount of USDT to be used for purchasing tokens.
     */
    function purchaseTokensWithUSDT(address affi, uint256 amount) public {
        require(saleActive, "Sale not active!");
        usdt.transferFrom(msg.sender, address(this), amount);
        usdtInvestment[msg.sender] = usdtInvestment[msg.sender].add(amount);

        if (affi != address(0) && affi != msg.sender) {
            referral(affi, amount, 1);
        }

        price = getTokenCurrentPrice();
        uint256 usdToTokens = amount.mul(1e18).div(price);
        uint256 tokenAmountDecimalFixed = usdToTokens.mul(1e12);

        require(tokenAmountDecimalFixed >= dnr.balanceOf(address(this)), "Contract balance");
        dnr.transfer(msg.sender, tokenAmountDecimalFixed);
        tokenSold = tokenSold.add(tokenAmountDecimalFixed);
        forwardFunds();

        emit TokensPurchasedWithUSDT(msg.sender, tokenAmountDecimalFixed);
    }

    /**
     * @dev Function to purchase tokens using Matic. Handles referral commissions if applicable.
     * @param affi The address of the referrer.
     */
    function purchaseWithMatic(address affi) public payable {
        require(msg.value > 0, "Enter some valid amount!");
        require(saleActive, "Sale not active!");

        if (affi != address(0) && affi != msg.sender) {
            referral(affi, msg.value, 2);
        }

        uint256 maticPrice = getOneMaticPrice();
        uint256 maticToUsd = msg.value.mul(maticPrice).div(1e8); // Adjusting the decimals for Chainlink price feed

        uint256 currentPrice = getTokenCurrentPrice();
        uint256 usdToTokens = maticToUsd.mul(1e18).div(currentPrice); // Ensure correct scaling

        require(usdToTokens > 0, "Token amount is zero");

        require(usdToTokens >= dnr.balanceOf(address(this)), "Contract balance");
        dnr.transfer(msg.sender, usdToTokens);
        maticInvestment[msg.sender] = maticInvestment[msg.sender].add(msg.value);
        tokenSold = tokenSold.add(usdToTokens);
        payable(owner()).transfer(address(this).balance);

        emit TokensPurchasedWithMatic(msg.sender, usdToTokens);
    }

    /**
     * @dev Internal function to forward funds to the owner.
     */
    function forwardFunds() internal {
        payable(owner()).transfer(address(this).balance);
        usdt.transfer(owner(), usdt.balanceOf(address(this)));
        emit FundsForwarded();
    }

    /**
     * @dev Withdraws collected funds. Only callable by the owner.
     */
    function withdrawFunds() public onlyOwner {
        forwardFunds();
    }

    /**
     * @dev Calculates the amount of tokens for a given amount of USDT.
     * @param amount The amount of USDT.
     * @return The equivalent amount of tokens.
     */
    function calculateTokenAmount(uint256 amount)
        external
        view
        returns (uint256)
    {
        uint256 tokens = amount.mul(price);
        return tokens;
    }

    /**
     * @dev Returns the current token price.
     * @return The current price of the token.
     */
    function tokenPrice() external view returns (uint256) {
        return price;
    }

    /**
     * @dev Returns the investment details of a given address.
     * @param add The address to query.
     * @return The amounts of Matic and USDT invested by the address.
     */
    function investments(address add) external view returns (uint256, uint256) {
        return (maticInvestment[add], usdtInvestment[add]);
    }

    /**
     * @dev Sets the address of the DNR token contract.
     * @param tokenAddress The address of the DNR token contract.
     */
    function setDNRTokenAddress(address tokenAddress) external onlyOwner {
        DNRToken = tokenAddress;
    }

    /**
     * @dev Updates the sale status to active. Only callable by the owner.
     */
    function startSale() public onlyOwner {
        saleActive = true;
        emit SaleStarted();
    }

    /**
     * @dev Updates the sale status to inactive. Only callable by the owner.
     */
    function stopSale() public onlyOwner {
        saleActive = false;
        emit SaleStopped();
    }

    /**
     * @dev Withdraws remaining tokens after the ICO ends. Only callable by the owner.
     */
    function withdrawRemainingTokensAfterICO() public onlyOwner {
        uint256 remainingTokens = dnr.balanceOf(address(this));
        require(
            remainingTokens > 0,
            "Tokens not available in contract, contact admin!"
        );
        dnr.transfer(msg.sender, remainingTokens);
        emit RemainingTokensWithdrawn();
    }
}
