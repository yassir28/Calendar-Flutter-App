import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:menstruating/models/queen.dart';

class DataBaseService {
  final String uid;
  DataBaseService({this.uid});

  //collection reference
  final CollectionReference users =
      FirebaseFirestore.instance.collection('Queens');

  Future initiatePeriodData(
      {int periodLength, DateTime periodDate, int periodCycle}) async {
    return await users
        .doc(uid)
        .set({
          'period length': periodLength,
          'period cycle': periodCycle,
          'period date': periodDate,
        })
        .then((value) => print('User initiated Suxsuxfully'))
        .catchError((error) => print(error));
  }

  Future updatePeriodLength({int periodLength}) async {
    return await users
        .doc(uid)
        .set({
          'period length': periodLength,
        }, SetOptions(merge: true))
        .then((value) => print('User Updated Suxsuxfully'))
        .catchError((error) => print(error));
  }

  Future updatePeriodCycle({int periodCycle}) async {
    return await users
        .doc(uid)
        .set({
          'period cycle': periodCycle,
        }, SetOptions(merge: true))
        .then((value) => print('User Updated Suxsuxfully'))
        .catchError((error) => print(error));
  }

  Future updatePeriodDate({DateTime periodDate}) async {
    return await users
        .doc(uid)
        .set({
          'period date': periodDate,
        }, SetOptions(merge: true))
        .then((value) => print('User Updated Suxsuxfully'))
        .catchError((error) => print(error));
  }

  Future getData() async {
    return await users.doc(uid).get();
  }

/*
// queen list from snapshot
  List<Queen> _queenListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Queen(
        periodCycle: doc.data()['period cycle'] ?? 28,
        periodLength: doc.data()['period length'] ?? 3,
        periodDate: doc.data()['period date'] ?? null,
      );
    }).toList();
  }

// when data change in db we use can use this stream to provide us with changes
  Stream<List<Queen>> get queens {
    return users
        .snapshots()
        .map((snapshot) => _queenListFromSnapshot(snapshot));
  }*/
  // Stream<DocumentSnapshot> get queen  {
  //   return users.doc(uid).get().asStream();
  //   //.map((documentSnapshot) => _queenFromDocumentSnapshot(documentSnapshot));
  // }
/*
Queen _queenFromDocumentSnapshot(DocumentSnapshot snapshot) {
    return snapshot.data().map((data) {
      return Queen(
        periodCycle: data['period cycle'] ?? null,
        periodLength: data.data()['period length'] ?? null,
        periodDate: data.data()['period date'] ?? null,
      );
    });
  }
*/

}
