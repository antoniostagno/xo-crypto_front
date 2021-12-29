import 'package:flutter/material.dart';
import 'package:simple_listview/components/coin_card.dart';
import 'package:simple_listview/models/api.dart';
import 'package:simple_listview/models/coin.dart';

class CoinList extends StatefulWidget {
  static String id = '/crypto_list';

  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
  List<Coin> _listCoin = [];

  Future<void> load_cryptos() async {
    List<Coin> listTemp = await Api.get_cryptos();
    setState(() {
      _listCoin = listTemp;
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
    print(_listCoin);

    return Scaffold(
      appBar: AppBar(
        title: Text('xo-crypto.com'),
      ),
      body: _buildListView(),
    );
  }

  ListView _buildListView() {
    return ListView.builder(
      itemCount: _listCoin.length,
      itemBuilder: (context, index) {
        var item = _listCoin[index];
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          child: CoinCard(
            _listCoin[index],
          ),
        );
      },
    );
  }
}
