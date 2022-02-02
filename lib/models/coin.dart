import 'package:flutter/material.dart';
import 'dart:math';
import 'price.dart';

List<Price> GeneratePrices(int nbJours, DateTime startDate) {
  List<Price> prices = [];
  Random random = Random();
  DateTime jour = startDate;

  for (int i = 1; i <= nbJours; i++) {
    jour = jour.add(Duration(days:1));
    prices.add(Price(jour, random.nextInt(1000).toDouble()));
  }
  return prices;
}




class Coin {
  String name;
  double currentPrice;
  IconData icon;

  List<Price> _prices;
  List<Price> linearRegression12M;
  List<Price> linearRegression6M;
  List<Price> linearRegression1M;
  List<Price> linearRegression1W;

  Coin(this.name, this.currentPrice,
      this.icon,
      this._prices,
      this.linearRegression12M,
      this.linearRegression6M,
      this.linearRegression1M,
      this.linearRegression1W);

  factory Coin.fromJson(Map<String, dynamic> json) {
    return Coin(
      json['name'],
      json['current_price'],
      Icons.face,
      GeneratePrices(365, DateTime.now().subtract(Duration(days:365))),
      GeneratePrices(0, DateTime.now().subtract(Duration(days:365))),
      GeneratePrices(0, DateTime.now().subtract(Duration(days:180))),
      GeneratePrices(0, DateTime.now().subtract(Duration(days:30))),
      GeneratePrices(0, DateTime.now().subtract(Duration(days:7))),
    );
  }

  List<Price> getLastNumberOfDays(int nbdays){
    List<Price> prices = [];

    print(_prices.length);
    for(int i=_prices.length-1; i>_prices.length-nbdays; i--){
      prices.add(_prices[i]);
    }
    return prices;
  }
}
