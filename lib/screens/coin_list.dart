import 'package:flutter/material.dart';
import 'package:xo_crypto/components/bottom_nav.dart';
import 'package:xo_crypto/components/coin_card.dart';
import 'package:xo_crypto/models/api.dart';
import 'package:xo_crypto/models/coin.dart';
import 'package:xo_crypto/models/enum_screens.dart';
import 'package:xo_crypto/screens/coin_grid.dart';

class CoinList extends StatefulWidget {
  static String id = '/crypto_list';

  @override
  _CoinListState createState() => _CoinListState();
}

class _CoinListState extends State<CoinList> {
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
    print('crypto_list build');
    print(_listCoin);

    return Scaffold(
      appBar: AppBar(
        title: Text('xo-crypto.com'),
      ),
      body: _buildListView(),
      bottomNavigationBar: buildBottomNav(context, Screens.List),
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
