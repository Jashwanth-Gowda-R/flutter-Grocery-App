import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = [].obs;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  onInit() {
    super.onInit();
    fetchOrders();
  }

  fetchOrders() {
    _db.collection('orders').snapshots().listen((res) {
      var tmp = [];
      res.docs.forEach((order) {
        tmp.add({"id": order.id, ...order.data()});
      });
      orders.assignAll(tmp);
    });
  }

  updateOrder(id, obj) {
    _db.collection('orders').doc(id).update(obj).then((res) {
      print('order updated!');
    }).catchError((e) => print(e));
  }
}
