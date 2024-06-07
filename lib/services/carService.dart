import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projecto_final/models/carro.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as firestore;


Future<void> createCarroCollection(Carro carro) async {
  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection('carros'); // Replace with your desired collection name

  // Create a document with a generated ID
  final docRef = collection.doc();

  // Store car data (without user association)
  await docRef.set({
    'carga': carro.carga,
    'lote': carro.lote,
    'matricula': carro.matricula,
    'modelo': carro.modelo,
    'tipo': carro.tipo,
    'taxa': carro.taxa,
  });

  print('Carro added successfully!'); // Optional success message
}


class Carservice{
  Future<List<Carro>> getCars()async{
    try {
      firestore.CollectionReference transactionsRef = firestore.FirebaseFirestore.instance.collection('cars');
      firestore.QuerySnapshot querySnapshot = await transactionsRef.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      return querySnapshot.docs.map((doc) => Carro.fromFirestore(doc)).toList();
      log("message");
    } catch (e) {
      print('Error fetching transactions from Firestore: $e');
      return [];
    }
  }
}