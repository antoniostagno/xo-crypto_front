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
  List<Crypto> listCrypto = [];

  Future<void> load_cryptos() async {
    List<Crypto> listTemp = await Api.get_cryptos();
    setState(() {
      listCrypto = listTemp;
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
        title: Text('Crypto Utlimate'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: CryptoCard(
              listCrypto[index],
            ),
          );
        },
        itemCount: listCrypto.length,
      ),
    );
  }
}
