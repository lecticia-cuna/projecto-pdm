import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Informacoes extends StatefulWidget {
  const Informacoes({super.key});

  @override
  State<Informacoes> createState() => _InformacoesState();
}

class _InformacoesState extends State<Informacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Informações",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Tarifas:",
              style: GoogleFonts.quicksand(
                  fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              "Ligeiros: 40 MZN\nPesados: 120 MZN",
              style: GoogleFonts.quicksand(fontSize: 20),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15.0),
            Text(
              "Detalhes das contas móveis: \n841114789 - TRAC toll\n861114789 - TRAC toll",
              style: GoogleFonts.quicksand(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
