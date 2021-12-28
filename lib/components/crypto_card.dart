import 'package:flutter/material.dart';
import 'package:simple_listview/models/crypto.dart';

class CryptoCard extends StatelessWidget {
  Crypto crypto;

  CryptoCard(this.crypto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
            title: Text(crypto.name),
            leading: Icon(crypto.icon),
            subtitle: Text(crypto.currentPrice.toString()),
            onTap: () {}),
      ),
    );
  }
}
