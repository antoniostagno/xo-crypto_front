import 'package:flutter/material.dart';
import 'package:xo_crypto/models/coin.dart';
import 'package:xo_crypto/components/price_graph.dart';

class PriceChart extends StatefulWidget {
  static String id = '/price_chart';

  @override
  _PriceChartState createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  @override
  Widget build(BuildContext context) {
    final coin = ModalRoute.of(context)!.settings.arguments as Coin;

    return Scaffold(
      appBar: AppBar(
        title: Text(coin.name),
      ),
      body: PriceGraph(coin)
    );
  }
}
