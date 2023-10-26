import 'package:flutter/material.dart';
import 'package:hackaton_mobile/Screens/404_page.dart';
import 'package:hackaton_mobile/Screens/coin_page.dart';
import 'package:hackaton_mobile/Screens/details_page.dart';
import 'package:hackaton_mobile/Screens/home_page.dart';
import 'package:hackaton_mobile/Screens/nft_page.dart';

void main() { runApp(const MyApp());}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material',
      initialRoute: '/',
      routes : {
        '/':(context) => const HomePage(),
        '/coins':(context) => coinPage(),
        '/nfts':(context) => const NftPage(),
        '/details':(context)=> DetailsPage(id: '',),
      },
      onGenerateRoute:(settings){
        return MaterialPageRoute(builder: (context)=> const Page404());
      } ,
    );
  }
}



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar( 
    ));
  }

