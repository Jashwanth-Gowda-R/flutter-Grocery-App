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

  var allorders = [].obs;

  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  onInit() {
    super.onInit();
    fetchAllOrders();
    var today = DateTime.now();
    fetchOrders(today.toString());
  }

  calculate() {
    totalOrders.value = allorders.length;
    totalRevenue.value = 0;
    orderProcessingCount.value = 0;
    orderCompletedCount.value = 0;
    orderCancelledCount.value = 0;

    allorders.forEach((order) {
      print(order);
      if (order["status"] == "COMPLETED") {
        orderCompletedCount.value++;
        // create tmpTotal to avoid type conversion error
        // var tmpTotal = order["cartTotal"];
        // totalRevenue.value += tmpTotal;
        totalRevenue.value += (order["cartTotal"]).toInt();
      } else if (order["status"] == "Processing") {
        orderProcessingCount.value++;
      } else if (order["status"] == "CANCELLED") {
        orderCancelledCount.value++;
      }
    });
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
      calculate();
    }).catchError((e) => print(e));
  }

  fetchAllOrders() {
    _db.collection('orders').snapshots().listen((res) {
      var tmp = [];
      res.docs.forEach((order) {
        tmp.add({"id": order.id, ...order.data()});
      });
      allorders.assignAll(tmp);
      print(allorders);
      calculate();
    });
  }
}
