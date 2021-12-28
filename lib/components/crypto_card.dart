import 'package:flutter/material.dart';
import 'package:simple_listview/models/crypto.dart';

class CryptoCard extends StatelessWidget {
  Crypto crypto;

  CryptoCard(this.crypto);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
          leading: Icon(
            crypto.icon,
            color: Colors.red, //item.color,
          ),
          title: Text(crypto.name),
          subtitle: Text(crypto.currentPrice.toString()),
          trailing: GestureDetector(
              child: Icon(
                Icons.arrow_forward,
                color: Colors.red,
              ),
              onTap: () {
                // ouvrir la fenêtre avec la courbe
              })),
    );
  }
}
