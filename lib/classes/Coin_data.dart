import 'dart:convert';
import 'package:http/http.dart';

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
  'ZAR',
  'INR',
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData{


   double price;

  Future getBit(String selectedCurrency) async{
    Response response = await get('https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC$selectedCurrency');
    String source = response.body;

    if(response.statusCode == 200){
          price = json.decode(source)['last'];
         return price;
    }else{
      print(response.statusCode);
    }
   
  }

    Future getEth(String selectedCurrency) async{
    Response response = await get('https://apiv2.bitcoinaverage.com/indices/global/ticker/ETH$selectedCurrency');
    String source = response.body;

    if(response.statusCode == 200){
          price = json.decode(source)['last'];
         return price;
    }else{
      print(response.statusCode);
    }
   
  }

    Future getLit(String selectedCurrency) async{
    Response response = await get('https://apiv2.bitcoinaverage.com/indices/global/ticker/LTC$selectedCurrency');
    String source = response.body;

    if(response.statusCode == 200){
          price = json.decode(source)['last'];
         return price;
    }else{
      print(response.statusCode);
    }
   
  }

   Future getBtcc(String selectedCurrency) async{
    Response response = await get('https://apiv2.bitcoinaverage.com/indices/global/ticker/BCH$selectedCurrency');
    String source = response.body;

    if(response.statusCode == 200){
          price = json.decode(source)['last'];
         return price;
    }else{
      print(response.statusCode);
    }
   
  }

}