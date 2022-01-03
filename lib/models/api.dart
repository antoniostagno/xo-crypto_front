import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:xo/models/coin.dart';

class Api {
  static String url = 'https://cryptoscriptultimate.herokuapp.com';

  static Future<List<Coin>> get_cryptos() async {
    List<Coin> list_cryptos = [];

    try {
      final response = await http.get(Uri.parse(url + '/list_cryptos'));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        List list = jsonDecode(response.body);

        for (var crypto in list) {
          list_cryptos.add(Coin.fromJson(crypto));
        }

        return list_cryptos;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load album');
      }
    } catch (err) {
      print('Something went wrong');
    }
    return list_cryptos;
  }
}
