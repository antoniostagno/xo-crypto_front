// main.dart from https://www.kindacode.com/article/flutter-listview-pagination-load-more/
import 'package:flutter/material.dart';
import 'package:simple_listview/screens/crypto_list.dart';
import 'package:simple_listview/screens/price_chart.dart';

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
        initialRoute: CryptoList.id,
        routes: {
          CryptoList.id: (context) => CryptoList(),
          PriceChart.id: (context) => PriceChart(),
        }
    );
  }
}