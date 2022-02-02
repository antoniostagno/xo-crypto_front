import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:xo_crypto/models/coin.dart';
import 'package:xo_crypto/models/price.dart';

class PriceGraph extends StatelessWidget {
  Coin _coin;

  PriceGraph(this._coin);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: [
            Row(
            children:[
              Expanded(
                child: SfCartesianChart(
                  title: ChartTitle(text:"12 mois"),
                primaryXAxis: DateTimeAxis(),
                series: <ChartSeries>[
                  LineSeries<Price, DateTime>(
                    name: "Prix",
                    color: Colors.red,
                    dataSource: _coin.getLastNumberOfDays(365),
                    xValueMapper: (Price price, _) => price.datetime,
                    yValueMapper: (Price price, _) => price.price,
                  ),
                  LineSeries<Price, DateTime>(
                    name: "LinearRegression",
                    color: Colors.green,
                    dataSource: _coin.linearRegression12M,
                    xValueMapper: (Price price, _) => price.datetime,
                    yValueMapper: (Price price, _) => price.price,
                  )
                ],
            ),
              ),
              Expanded(
                child: SfCartesianChart(
                  title: ChartTitle(text:"6 mois"),
                  primaryXAxis: DateTimeAxis(),
                  series: <ChartSeries>[
                    LineSeries<Price, DateTime>(
                      name: "Prix",
                      color: Colors.red,
                      dataSource: _coin.getLastNumberOfDays(180),
                      xValueMapper: (Price price, _) => price.datetime,
                      yValueMapper: (Price price, _) => price.price,
                    ),
                    LineSeries<Price, DateTime>(
                      name: "LinearRegression",
                      color: Colors.green,
                      dataSource: _coin.linearRegression12M,
                      xValueMapper: (Price price, _) => price.datetime,
                      yValueMapper: (Price price, _) => price.price,
                    )
                  ],
                ),
              )]
          ),
          Row(
            children:[
              Expanded(
                child: SfCartesianChart(
                  title: ChartTitle(text:"1 mois"),
                primaryXAxis: DateTimeAxis(),
                series: <ChartSeries>[
                  LineSeries<Price, DateTime>(
                    name: "Prix",
                    color: Colors.red,
                    dataSource: _coin.getLastNumberOfDays(30),
                    xValueMapper: (Price price, _) => price.datetime,
                    yValueMapper: (Price price, _) => price.price,
                  ),
                  LineSeries<Price, DateTime>(
                    name: "LinearRegression",
                    color: Colors.green,
                    dataSource: _coin.linearRegression12M,
                    xValueMapper: (Price price, _) => price.datetime,
                    yValueMapper: (Price price, _) => price.price,
                  )
                ],
            ),
              ),
              Expanded(
                child: SfCartesianChart(
                  title: ChartTitle(text:"1 semaine"),
                  primaryXAxis: DateTimeAxis(),
                  series: <ChartSeries>[
                    LineSeries<Price, DateTime>(
                      name: "Prix",
                      color: Colors.red,
                      dataSource: _coin.getLastNumberOfDays(7),
                      xValueMapper: (Price price, _) => price.datetime,
                      yValueMapper: (Price price, _) => price.price,
                    ),
                    LineSeries<Price, DateTime>(
                      name: "LinearRegression",
                      color: Colors.green,
                      dataSource: _coin.linearRegression12M,
                      xValueMapper: (Price price, _) => price.datetime,
                      yValueMapper: (Price price, _) => price.price,
                    )
                  ],
                ),
              )]
          )]
        ));
  }
}
