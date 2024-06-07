import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:projecto_final/models/credito.dart';
import 'package:projecto_final/models/transaction.dart' as m;
import 'package:projecto_final/services/transactionService.dart';

class Creditservice {
  Future recharge(Credito credito) async {
    final u = FirebaseAuth.instance.currentUser;
    final userRef = FirebaseFirestore.instance.collection("users").doc(u!.uid);

    await FirebaseFirestore.instance.runTransaction((transaction) async {
      // Get the current user document
      DocumentSnapshot userSnapshot = await transaction.get(userRef);

      // Check if the document exists
      if (userSnapshot.exists) {
        // Get the current credit
        double currentCredit = double.parse(userSnapshot.get('credit').toString());

        // Increase the credit
        double newCredit = currentCredit + credito.valor;

        // Update the credit field
        transaction.update(userRef, {'credit': newCredit});
        await Transactionservice().saveTransaction(
          m.Transaction(
              type: m.TransactionType.recharge,
              timestamp: DateTime.now(),
              value: credito.valor,
              userId: u.uid),
        );
      } else {
        print('User not found');
      }
    });
  }
}
