import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),


   body: Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Padding(
        padding: EdgeInsets.all(16.0), // Agrega el padding que desees
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/coins");
          },
          child: const Text('Ver criptos'),
        ),
      ),
      SizedBox(height: 16.0), 
      Padding(
        padding: EdgeInsets.only( left:50.0,right: 50.0), 
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/nfts");
          },
          child: const Text('Ver Nfts'),
        ),
      ),
    ],
  ),
),

    );
  }
}