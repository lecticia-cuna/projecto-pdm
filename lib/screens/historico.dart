import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projecto_final/models/transaction.dart';
import 'package:projecto_final/services/transactionService.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  List<Transaction> transactions = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHistorico();
  }

  double saldoDisponivel = 0.0;

  Future getHistorico() async {
    final data = await Transactionservice().getTransaction();
    setState(() {
      transactions = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Histórico",
          style: GoogleFonts.quicksand(
              color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        toolbarHeight: 150,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final t = transactions[index];
          final data = "${t.timestamp.day}/${t.timestamp.month}/${t.timestamp.year}";
          return Card(
            child: ListTile(
              leading: Text(
                t.type == TransactionType.recharge ? "Recarga" : "Pagamento",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${t.value} MZN", style: TextStyle(fontSize: 14),),
                  Text("$data")
                ],
              ),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
