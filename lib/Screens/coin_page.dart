import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:hackaton_mobile/Models/Coins.dart';
import 'package:http/http.dart' as http;
class coinPage extends StatefulWidget {
    coinPage({super.key});


  @override
  State<coinPage> createState() => _coinPageState();
}
class _coinPageState extends State<coinPage> {
  
  List<Coin> coins = [];

//get Coins
Future getCoins()async{
 var response = await http.get(Uri.https('api.coingecko.com','api/v3/coins/list'));
  var jsonData= jsonDecode(response.body);  

  for (var eachCoin in jsonData){
    final coin = Coin(
        id: eachCoin['id'],
        name: eachCoin['name'],
      symbol: eachCoin['symbol'],
    );
    coins.add(coin);
    }
    print(coins.length);
  }

  
  @override
  Widget build(BuildContext context) {
    getCoins();
    return Scaffold(
      
      appBar: AppBar(
        title: const Text('Coins'),
      ),  
      body: FutureBuilder(
  future: getCoins(),
  builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
      return ListView.builder(
        itemCount: coins.length,
        itemBuilder: (context, index) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    coins[index].name,
                     style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    coins[index].id,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                  Text(
                    coins[index].name,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                 ElevatedButton(
  onPressed: () {
    final id = coins[index].id;
    Navigator.pushNamed(context, '/details', arguments: id);
  },
  child: Text("Details"),
),
                ],
              ),
            ),
          );
        },
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  },
)
    );
  }
}