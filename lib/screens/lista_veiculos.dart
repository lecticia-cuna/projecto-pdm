import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Carro {
  final double carga;
  final String lote;
  final String matricula;
  final String modelo;
  final String tipo;
  final double taxa;

  Carro({
    required this.carga,
    required this.lote,
    required this.matricula,
    required this.modelo,
    required this.taxa,
    required this.tipo,
  });
}

List<Carro> simulatedCarros = [

  Carro(
    carga: 3500.0,
    lote: '5 Lugares',
    matricula: 'ABC 072 MP',
    modelo: 'Toyota',
    taxa: 40.0,
    tipo: 'Auris',
  ),
  Carro(
    carga: 2755.0,
    lote: '7 Lugares',
    matricula: 'AEF 567 MC',
    modelo: 'Toyota',
    taxa: 40.0,
    tipo: 'Spacio',
  ),
  Carro(
    carga: 3500.0,
    lote: '5 lugares',
    matricula: 'AHI 478 MP',
    modelo: 'BMW',
    taxa: 0.10,
    tipo: 'X5',
  ),
];

class ListaVeiculos extends StatefulWidget {
  const ListaVeiculos({super.key});

  @override
  State<ListaVeiculos> createState() => _ListaVeiculosState();
}

class _ListaVeiculosState extends State<ListaVeiculos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Lista de Veículos",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: simulatedCarros.length,
        itemBuilder: (BuildContext context, int index) {
          final carro = simulatedCarros[index];
          return Card(
            margin: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                // Show vehicle details on tap
                _showVehicleDetails(carro);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      carro.modelo,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8.0),
                    Text('Matricula: ${carro.matricula}')
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _showVehicleDetails(Carro carro) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(carro.modelo),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Matricula: ${carro.matricula}'),
                SizedBox(height: 8.0),
                Text('Lote: ${carro.lote}'),
                SizedBox(height: 8.0),
                Text('Carga: ${carro.carga.toStringAsFixed(2)}'),
                SizedBox(height: 8.0),
                Text('Tipo: ${carro.tipo}'),
                SizedBox(height: 8.0),
                Text('Taxa: ${carro.taxa.toStringAsFixed(2)}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
