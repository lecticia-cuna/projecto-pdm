import 'package:cloud_firestore/cloud_firestore.dart';

class Transaction {
  final TransactionType type;
  final DateTime timestamp;
  final double value;
  final String userId;

  Transaction(
      {required this.type,
      required this.timestamp,
      required this.value,
      required this.userId});

  Map<String, dynamic> toMap() {
    return {
      'type': type.toString().split('.').last, // Convert enum to string
      'timestamp': timestamp,
      'value': value,
      'userId': userId,
    };
  }

  factory Transaction.fromFirestore(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return Transaction(
      type: TransactionType.values.firstWhere((e) => e.toString() == 'TransactionType.${data['type']}'),
      timestamp: (data['timestamp'] as Timestamp).toDate(),
      value: data['value'],
      userId: data['userId'],
    );
  }
}

enum TransactionType { recharge, payment }
