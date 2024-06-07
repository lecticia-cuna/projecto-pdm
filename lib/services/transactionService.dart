import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projecto_final/models/transaction.dart';

class Transactionservice {
  Future saveTransaction(Transaction transacao)async{
    try{
      firestore.CollectionReference transactionsRef = firestore.FirebaseFirestore.instance.collection('transactions');
      await transactionsRef.add(transacao.toMap());
    }catch (e) {
      print('Error saving transaction to Firestore: $e');
    }
  }

  Future<List<Transaction>> getTransaction()async{
    try {
      firestore.CollectionReference transactionsRef = firestore.FirebaseFirestore.instance.collection('transactions');
      firestore.QuerySnapshot querySnapshot = await transactionsRef.where("userId", isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();

      return querySnapshot.docs.map((doc) => Transaction.fromFirestore(doc)).toList();
    } catch (e) {
      print('Error fetching transactions from Firestore: $e');
      return [];
    }
  }
}