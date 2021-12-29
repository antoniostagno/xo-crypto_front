// main.dart from https://www.kindacode.com/article/flutter-listview-pagination-load-more/
import 'package:flutter/material.dart';
import 'screens/coin_grid.dart';
import 'screens/coin_list.dart';
import 'screens/price_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('my app');
    return MaterialApp(
        // Remove the debug banner
        debugShowCheckedModeBanner: false,
        title: 'xo-crypto.com',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        initialRoute: CoinList.id,
        routes: {
          CoinList.id: (context) => CoinList(),
          CoinGrid.id: (context) => CoinGrid(),
          PriceChart.id: (context) => PriceChart(),
        }
    );
  }
}