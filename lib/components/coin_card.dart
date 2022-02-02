import 'package:flutter/material.dart';
import 'package:xo_crypto/models/coin.dart';
import 'package:xo_crypto/screens/coin_grid.dart';
import 'package:xo_crypto/screens/price_chart.dart';

class CoinCard extends StatelessWidget {
  Coin coin;

  CoinCard(this.coin);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
          leading: Icon(
            coin.icon,
            color: Colors.red, //item.color,
          ),
          onTap: () {
            Navigator.pushNamed(context, CoinGrid.id);
          },
          title: Text(coin.name),
          subtitle: Text(coin.currentPrice.toString()),
          trailing: GestureDetector(
              child: Icon(
                Icons.arrow_forward,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.pushNamed(context,
                    PriceChart.id,
                  arguments: coin
                );
              })),
    );
  }
}
