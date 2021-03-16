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

  listFromDocumentSnapshot(DocumentSnapshot doc) {
    return doc.data();
  }

  Stream get queen {
    return users.doc(uid).snapshots();
  }

  Future getData() async {
    return await users.doc(uid).get();
  }
}
