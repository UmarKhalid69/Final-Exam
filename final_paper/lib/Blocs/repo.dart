import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_paper/Blocs/model.dart';

class TransactionRepo {
  // Future<List<TransactionModel>> getTransactions() async {
  //   final transactionCollection =
  //       FirebaseFirestore.instance.collection('transactions');
  //   return transactionCollection.snapshots().map((snapshot) {
  //     return snapshot.docs
  //         .map((doc) => TransactionModel.fromJson(doc as Map<String, dynamic>))
  //         .toList();
  //   });
  // }

  Future<List<TransactionModel>> getTransactions() async {
    final transactionCollection =
        FirebaseFirestore.instance.collection('transactions');

    try {
      final snapshot = await transactionCollection.get();
      print(snapshot.docs[0].data());
      return snapshot.docs
          .map((doc) =>
              TransactionModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Error getting transactions: $e');
      return [];
    }
  }
}
