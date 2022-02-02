import 'package:flutter/material.dart';
import 'package:xo_crypto/components/bottom_nav.dart';
import 'package:xo_crypto/models/api.dart';
import 'package:xo_crypto/models/coin.dart';
import 'package:xo_crypto/models/enum_screens.dart';

class CoinGrid extends StatefulWidget {
  static String id = '/crypto_grid';

  @override
  _CoinGridState createState() => _CoinGridState();
}

class _CoinGridState extends State<CoinGrid> {
  List<Coin> _listCoin = [];

  Future<void> load_coins() async {
    List<Coin> listTemp = await Api.get_cryptos();
    setState(() {
      _listCoin = listTemp;
    });
  }

  @override
  void initState() {
    load_coins();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xo-crypto.com'),
      ),
      body: _buildGridView(),
      bottomNavigationBar: buildBottomNav(context, Screens.Grid),
    );
  }

   // appelle soit _buildGridView soit _buildListView
  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _listCoin.length,
        itemBuilder: (context, index) {
          var item = _listCoin[index];
          return Card(
              elevation: 4.0,
              child: Stack(
                fit: StackFit.loose,
                alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        item.icon,
                        color: (_listCoin.contains(item))
                            ? Colors.grey
                            : Colors.red, //item.color,
                        size: 100.0,
                      ),
                      Text(
                        item.name,
                        textAlign: TextAlign.center,
                        //style: Theme.of(context).textTheme.subhead,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8.0,
                      bottom: 8.0,
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        ),
                        onTap: () {
                          setState(() {

                          });
                        },
                      ),
                    ),
                  ),
                ],
              ));
        });
  }
}
