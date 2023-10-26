import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackaton_mobile/Models/Nfts.dart';
import 'package:http/http.dart' as http;
 class NftPage extends StatefulWidget {
   const NftPage({super.key});
 
   @override
   State<NftPage> createState() => _NftPageState();
 }
 
 class _NftPageState extends State<NftPage> {



    List<Nfts> ntfs = [];

//get Coins
Future getNfts() async {
  var response = await http.get(Uri.https('api.coingecko.com', '/api/v3/nfts/list', {'per_page': '100', 'page': '1'}));
  var jsonData = jsonDecode(response.body);

  for (var eachNft in jsonData) {
    final nft = Nfts(
      id: eachNft['id'],
      name: eachNft['name'],
      contractAddress: eachNft['contract_address'], 
      assetPlatformId: eachNft['asset_platform_id'], 
    );
    ntfs.add(nft);
  }
  print(ntfs.length);
}
   @override
   Widget build(BuildContext context) {
     return Scaffold(
      
      appBar: AppBar(
        title: const Text('Ntfs'),
      ),  
       body: FutureBuilder(
        future: getNfts(),
        builder:(context,snapshot){
          //Terminó de cargar? Hace esto
          if(snapshot.connectionState==ConnectionState.done){
            return ListView.builder(itemBuilder: 
            (context, index) {
          return Card(
            child:Padding(padding: const EdgeInsets.all(16.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
        
               Text(ntfs[index].name,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:FontWeight.bold
                ),),
                
                Text(ntfs[index].assetPlatformId, style: TextStyle(color: Colors.grey.shade700),),
                Text(ntfs[index].contractAddress, style: TextStyle(color: Colors.grey.shade700),)
              ],
            ),
          ),
          );
        },
            );
          }
          //No terminó, muestra un loader
          else {
            return Center(child: CircularProgressIndicator()
            );
          }
        },
        
      
        )
    );
   }
 }