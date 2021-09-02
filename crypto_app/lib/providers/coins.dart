import 'package:crypto_app/models/coins.dart';

class CoinsProvider{
  static List<Coins> table= [
    Coins(
        icon: 'images/btc.png',
        name: 'BitCoin',
        initials: "BTC",
        price: 200000.00
    ),
    Coins(
        icon: 'images/ethereum.png',
        name: 'Etherium',
        initials: "ETH",
        price: 10000.00
    ),
    Coins(
        icon: 'images/xrp.png',
        name: 'XRP',
        initials: "XRP",
        price: 3.34
    ),
    Coins(
        icon: 'images/cardano.png',
        name: 'Cardano',
        initials: "ADA",
        price: 6.32
    ),
    Coins(
        icon: 'images/usdc.png',
        name: 'Usd Coin',
        initials: "USDC",
        price: 5.00
    ),
    Coins(
        icon: 'images/litecoin.png',
        name: 'Litecoin',
        initials: "LTC",
        price: 670.00
    ),
  ];

}