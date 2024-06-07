import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

class Carro{
  final double carga;
  final String lote;
  final String matricula;
  final String modelo;
  final String tipo;
  final double taxa;

  Carro({required this.carga,required this.lote,required this.matricula,required this.modelo,required this.taxa,required this.tipo});

  factory Carro.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    print(data);
    return Carro(
      carga: double.parse(data["carga"].toString()),
      lote: data["lote"],
      matricula: data["matricula"],
      modelo: data["modelo"],
      tipo: data["tipo"],
      taxa: double.parse(data["taxa"].toString()),
    );
  }
}