import 'package:flutter/material.dart';
import 'package:simple_listview/models/api.dart';
import 'package:simple_listview/models/coin.dart';

class CoinGrid extends StatefulWidget {
  static String id = '/crypto_grid';

  @override
  _CoinGridState createState() => _CoinGridState();
}

class _CoinGridState extends State<CoinGrid> {
  List<Coin> _listCrypto = [];
  List<Coin> _cartCrypto = [];

  Future<void> load_cryptos() async {
    List<Coin> listTemp = await Api.get_cryptos();
    setState(() {
      _listCrypto = listTemp;
    });
  }

  @override
  void initState() {
    load_cryptos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('xo-crypto.com'),
      ),
      body: _buildGridView(),
    );
  }

   // appelle soit _buildGridView soit _buildListView
  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.all(4.0),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: _listCrypto.length,
        itemBuilder: (context, index) {
          var item = _listCrypto[index];
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
                        color: (_listCrypto.contains(item))
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
                        child: (!_cartCrypto.contains(item))
                            ? Icon(
                          Icons.add_circle,
                          color: Colors.green,
                        )
                            : Icon(
                          Icons.remove_circle,
                          color: Colors.red,
                        ),
                        onTap: () {
                          setState(() {
                            if (!_cartCrypto.contains(item))
                              _cartCrypto.add(item);
                            else
                              _cartCrypto.remove(item);
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
