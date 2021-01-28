import 'package:bitcoin_ticker/network.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String selectedcurrency;
  CoinData(this.selectedcurrency);

  Future<List<String>> getprice() async {
    List<String> currentrates = [];
    for (String cryptotype in cryptoList) {
      var url =
          'http://api.coinlayer.com/api/live?access_key=37024f61e5e2ab5c6f85215cf2e1ff2a&target=$selectedcurrency&symbols=$cryptotype';
      NetworkHelper networkHelper = NetworkHelper(url);
      var pricedata = await networkHelper.getData();
      double temp = pricedata["rates"][cryptotype];
      currentrates.add(temp.toStringAsFixed(2));
    }
    return currentrates;
  }
}
