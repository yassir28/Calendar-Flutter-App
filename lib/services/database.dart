import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Queens');

  Future updateUserData(
      int periodLength, int periodCycle, int periodDate) async {
    return await userCollection.doc(uid).set({
      'period length': periodLength,
      'period cycle': periodCycle,
      'period date': periodDate
    });
  }

// when data change in db we use can use this stream to provide us with changes
  Stream<QuerySnapshot> get queens {
    return userCollection.snapshots();
  }
}
