import 'package:flutter/material.dart';

class Crypto {
  String name;
  double currentPrice;
  IconData icon;

  Crypto(this.name, this.currentPrice, this.icon);

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      json['name'],
      json['current_price'],
      Icons.face,
    );
  }
}
