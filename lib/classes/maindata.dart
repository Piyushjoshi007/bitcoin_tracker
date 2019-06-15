import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bitcoin_tracker/classes/containerData.dart';
import 'Coin_data.dart';
import 'dart:io' show Platform;


class MainData extends StatefulWidget {
  MainData({Key key}) : super(key: key);

  _MainDataState createState() => _MainDataState();
}

class _MainDataState extends State<MainData> {
  String selectedCurrency = 'USD';

  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownMenu = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: (currency),
      );
      dropdownMenu.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownMenu,
      elevation: 0,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
      ),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getInfo();
        });
      },
    );
  }

  Widget getPicker(){
    if(Platform.isIOS){
      return iosPicker();
    }else if(Platform.isAndroid){
      return androidDropdown();
    }
  }

  CupertinoPicker iosPicker() {
    List<Text> menu = [];

    for (String currency in currenciesList) {
      menu.add(Text(currency,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)));
    }
    return CupertinoPicker(
      backgroundColor: Color(0xffeb1555),
      children: menu,
      itemExtent: 50,
      magnification: 1,
      onSelectedItemChanged: (selectedItem) {
        selectedCurrency = currenciesList[selectedItem];
        getInfo();
        
      },
    );
  }

  String bitCoinValue = 'fetching..';
  String ethCoinValue = 'fetching..';
  String litCoinValue = 'fetching..';
  String bitCoinCash = 'Fetching..';
  void getInfo() async {
    try{
      double dataBit = await CoinData().getBit(selectedCurrency);
      setState(() {
       bitCoinValue = dataBit.toStringAsFixed(0);
      });
      double dataEth = await CoinData().getEth(selectedCurrency);
      setState(() {
       ethCoinValue = dataEth.toStringAsFixed(0);
      });
      double dataLit = await CoinData().getLit(selectedCurrency);
      setState(() {
       litCoinValue = dataLit.toStringAsFixed(0);
      });
      double databtcc = await CoinData().getBtcc(selectedCurrency);
      setState(() {
       bitCoinCash = databtcc.toStringAsFixed(0);
      });
      
    }
    catch(e){
      print(e);
    }
  }





  @override
  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '🤑 Bitcoin Tracker',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 30,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: ContainerMain(
              data: '1-ETH = $ethCoinValue $selectedCurrency',
            ),
          ),
          Expanded(
            child: ContainerMain(
              data: '1-BTC = $bitCoinValue $selectedCurrency',
            ),
          ),
           Expanded(
            child: ContainerMain(
              data: '1-BCH = $bitCoinCash $selectedCurrency',
            ),
          ),
          Expanded(
            child: ContainerMain(
              data: '1-LIT = $litCoinValue $selectedCurrency',
            ),
          ),
          Container(
            color: Color(0xffeb1555),
            padding: EdgeInsets.only(bottom: 30),
            height: 100,
            child: Center(
              child: getPicker(),
            ),
          ),
        ],
      ),
    );
  }
}

class Cupertino {}
