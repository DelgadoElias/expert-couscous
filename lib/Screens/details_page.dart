import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String id; // Añade una propiedad para almacenar el id

  DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    final String id = widget.id; // Obtiene el id desde las propiedades del widget
    final apiUrl = 'https://api.coingecko.com/api/v3/coins/$id';

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de $id'),
      ),
      body: Center(
        child: Text('URL completa: $apiUrl'),
      ),
    );
  }
}