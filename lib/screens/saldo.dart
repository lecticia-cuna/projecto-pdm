import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Saldo extends StatefulWidget {
  const Saldo({super.key});

  @override
  State<Saldo> createState() => _SaldoState();
}

class _SaldoState extends State<Saldo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSaldo();
  }

  double saldoDisponivel = 0.0;

  Future getSaldo() async {
    final u = FirebaseAuth.instance.currentUser;
    final doc =
        await FirebaseFirestore.instance.collection("users").doc(u!.uid).get();
    final saldo = doc.data();
    print(saldo);
    if (saldo != null) {
      setState(() {
        saldoDisponivel = double.parse(saldo["credit"].toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Saldo',
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Container(
          width: 220,
          height: 220,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            border: Border.fromBorderSide(
              BorderSide(width: 16, color: Colors.blue),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                saldoDisponivel.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text("Total"),
              const Spacer(),
              const Text("MZN"),
              const SizedBox(height: 20,)
            ],
          ),
        ),
      ),
    );
  }
}
