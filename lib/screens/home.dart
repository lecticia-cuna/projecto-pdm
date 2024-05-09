import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecto_final/screens/historico.dart';
import 'package:projecto_final/screens/informacoes.dart';
import 'package:projecto_final/screens/lista_veiculos.dart';
import 'package:projecto_final/screens/saldo.dart';
import 'package:projecto_final/screens/suporte.dart';

import 'recarregar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> cardTitles = [
    'Recarregar',
    'Saldo',
    'Lista de Veículos',
    'Histórico',
    'Informações',
    'Suporte'
  ];

  final List<Widget> destinationPages = [
    Recarregar(),
    Saldo(),
    ListaVeiculos(),
    Historico(),
    Informacoes(),
    Suporte(), // Replace with the widget of your page4.dart
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu Principal",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 160,
        backgroundColor: Colors.blue,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: cardTitles.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => destinationPages[index]),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cardTitles[index],
                        style: GoogleFonts.quicksand(
                          fontSize: 18,
                          fontWeight: FontWeight.bold, // Make the text bold
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
