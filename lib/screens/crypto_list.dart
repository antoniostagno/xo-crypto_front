import 'package:flutter/material.dart';
import 'package:simple_listview/components/crypto_card.dart';
import 'package:simple_listview/models/api.dart';
import 'package:simple_listview/models/crypto.dart';

class CryptoList extends StatefulWidget {
  static String id = '/crypto_list';

  @override
  _CryptoListState createState() => _CryptoListState();
}

class _CryptoListState extends State<CryptoList> {
  List<Crypto> _listCrypto = [];
  List<Crypto> _cartCrypto = [];

  Future<void> load_cryptos() async {
    List<Crypto> listTemp = await Api.get_cryptos();
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
    print('crypto_list build');
    print(_listCrypto);

    return Scaffold(
      appBar: AppBar(
        title: Text('xo-crypto.com'),
      ),
      body: _buildListView(),
    );
  }

  // appelle soit _buildGridView soit _buildListView
  ListView _buildListView() {
    return ListView.builder(
      itemCount: _listCrypto.length,
      itemBuilder: (context, index) {
        var item = _listCrypto[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: CryptoCard(
            _listCrypto[index],
          ),
        );
      },
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
