import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/cart.dart';

class OrderController extends GetxController {
  var orders = [].obs;
  FirebaseFirestore _db = FirebaseFirestore.instance;
  FirebaseAuth _auth = FirebaseAuth.instance;
  CartController _cartCtrl = Get.put(CartController());

  @override
  onInit() {
    super.onInit();
    fetchOrders();
  }

  fetchOrders() {
    _db
        .collection('orders')
        .where('userId', isEqualTo: _auth.currentUser.uid)
        .snapshots()
        .listen((res) {
      var tmp = [];
      res.docs.forEach((order) {
        tmp.add({"id": order.id, ...order.data()});
      });
      orders.assignAll(tmp);
    });
  }

  createOrder() {
    var obj = {
      "userId": _auth.currentUser.uid,
      "cart": _cartCtrl.cart.value,
      "deliveryAddress": _cartCtrl.selectedAddress.value,
      "paymentMode": _cartCtrl.paymentMode.value,
      "createdAt": FieldValue.serverTimestamp(),
      "cartTotal": _cartCtrl.getTotalCartPrice(),
      "itemCount": _cartCtrl.getProductCount(),
      "status": "Processing"
    };

    _db.collection('orders').add(obj).then((res) {
      print('order placed');
      _cartCtrl.clearCart();
    }).catchError((e) {
      print(e);
    });
  }
}
