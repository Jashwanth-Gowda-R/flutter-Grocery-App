import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = [].obs;
  var totalOrders = 0.obs;
  var totalRevenue = 0.obs;
  var orderProcessingCount = 0.obs;
  var orderCompletedCount = 0.obs;
  var orderCancelledCount = 0.obs;

  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  onInit() {
    super.onInit();
    var today = DateTime.now();
    fetchOrders(today.toString());
  }

  fetchOrders(givenDate) {
    var from = DateTime.parse(givenDate);
    from = DateTime(from.year, from.month, from.day, 0, 0, 0);

    var to = DateTime.parse(givenDate);
    to = DateTime(from.year, from.month, from.day, 23, 59, 59);

    _db
        .collection('orders')
        .where("createdAt", isGreaterThanOrEqualTo: from)
        .where("createdAt", isLessThanOrEqualTo: to)
        .snapshots()
        .listen((res) {
      orders.clear();
      var tmp = [];
      res.docs.forEach((order) {
        tmp.add({"id": order.id, ...order.data()});
      });
      orders.assignAll(tmp);
      // calculate();
    });
  }

  updateOrder(id, obj) {
    _db.collection('orders').doc(id).update(obj).then((res) {
      print('order updated!');
    }).catchError((e) => print(e));
  }
}
