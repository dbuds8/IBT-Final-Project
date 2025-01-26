/*
/// Module: OF_Coin
module OF_Coin::OF_Coin;
*/

// For Move coding conventions, see
// https://docs.sui.io/concepts/sui-move-concepts/conventions


module OFCOIN::OFCOIN {
    use sui::coin;


    public struct OFCOIN has drop {}

    // Initialize the OF token
    fun init(witness: OFCOIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency<OFCOIN>(
            witness, // One-time witness
            18, // Decimals
            b"OF", // Symbol
            b"Only Friends Token", // Name
            b"A token that should be used only by friends", // Description
            option::none(), // Icon URL (optional)
            ctx // Transaction context
        );
        transfer::public_transfer(treasury, tx_context::sender(ctx));
        transfer::public_transfer(metadata, tx_context::sender(ctx)); // Transfer metadata to the deployer
    }

    // Mint new OF tokens
    public entry fun mint(
        treasury_cap: &mut coin::TreasuryCap<OFCOIN>,
        amount: u64,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let coins = coin::mint(treasury_cap, amount, ctx);
        transfer::public_transfer(coins, recipient);
    }

    // Burn OF tokens
    public entry fun burn(
        treasury_cap: &mut coin::TreasuryCap<OFCOIN>,
        coins: coin::Coin<OFCOIN>,
        _ctx: &mut TxContext // Prefix with underscore to suppress unused variable warning
    ) {
        coin::burn(treasury_cap, coins);
    }
}

