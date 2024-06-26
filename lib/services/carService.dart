import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projecto_final/models/carro.dart';



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
