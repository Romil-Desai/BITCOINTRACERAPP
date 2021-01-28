import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedcurrency = "USD";
  List<String> currentprice = [" ", " ", " "];

  List<DropdownMenuItem> getItems() {
    List<DropdownMenuItem> dropdownitemlist = [];
    for (int i = 0; i < currenciesList.length; i++) {
      DropdownMenuItem newitem = DropdownMenuItem(
        child: Text(currenciesList[i]),
        value: currenciesList[i],
      );
      dropdownitemlist.add(newitem);
    }
    return dropdownitemlist;
  }

  void updateUI() async {
    CoinData coinData = CoinData(selectedcurrency);
    List<String> temp = await coinData.getprice();
    setState(() {
      currentprice = temp;
    });
  }

  List<Widget> getcardlist() {
    List<Widget> cardlist = [];
    for (int i = 0; i < cryptoList.length; i++) {
      Widget newitem = Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 ${cryptoList[i]} =${currentprice[i]} $selectedcurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      cardlist.add(newitem);
    }
    return cardlist;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: getcardlist(),
            ),
          ),
          Container(
              height: 150.0,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 30.0),
              color: Colors.lightBlue,
              child: DropdownButton(
                value: selectedcurrency,
                items: getItems(),
                onChanged: (value) {
                  setState(() {
                    currentprice = [" ", " ", " "];
                    selectedcurrency = value;
                    updateUI();
                  });
                },
              )),
        ],
      ),
    );
  }
}
