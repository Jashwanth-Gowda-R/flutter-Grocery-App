import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var addresses = [].obs;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  getAllAddress() {
    _db
        .collection('addresses')
        .where('userId', isEqualTo: _auth.currentUser.uid)
        .snapshots()
        .listen((res) {
      res.docs.forEach((address) {
        var tmp = [];
        tmp.add({"id": address.id, ...address.data()});
      });
    });
  }

  addAddress(obj) {
    _db
        .collection('addresses')
        .add(obj)
        .then((value) => Get.back())
        .catchError((e) {
      print(e);
    });
  }

  updateAddress(id, obj) {
    _db
        .collection('addresses')
        .doc(id)
        .update(obj)
        .then((value) => Get.back())
        .catchError((e) {
      print(e);
    });
  }

  deleteAddress(id) {
    _db
        .collection('addresses')
        .doc(id)
        .delete()
        .then((value) => Get.back())
        .catchError((e) {
      print(e);
    });
  }
}
