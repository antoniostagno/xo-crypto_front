import 'package:flutter/material.dart';

class PriceChart extends StatefulWidget {
  static String id = '/price_chart';

  @override
  _PriceChartState createState() => _PriceChartState();
}

class _PriceChartState extends State<PriceChart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Price"),
      ),
      body: Container(

      )
    );
  }
}
