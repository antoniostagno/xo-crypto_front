import 'package:flutter/material.dart';

class Coin {
  String name;
  double currentPrice;
  IconData icon;

  Coin(this.name, this.currentPrice, this.icon);

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      json['name'],
      json['current_price'],
      Icons.face,
    );
  }
}
