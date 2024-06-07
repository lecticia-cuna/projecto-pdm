import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecto_final/models/carro.dart';
import 'package:projecto_final/services/carService.dart';

class ListaVeiculos extends StatefulWidget {
  const ListaVeiculos({super.key});

  @override
  State<ListaVeiculos> createState() => _ListaVeiculosState();
}

class _ListaVeiculosState extends State<ListaVeiculos> {
  List<Carro> cars = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCars();
  }


  Future getCars() async {
    final data = await Carservice().getCars();
    setState(() {
      cars = data;
    });
  }

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
        itemCount: cars.length,
        itemBuilder: (BuildContext context, int index) {
          final carro = cars[index];
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
