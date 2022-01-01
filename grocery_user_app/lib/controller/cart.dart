import 'package:get/get.dart';

class CartController extends GetxController {
  var cart = [].obs;

  addtocart(input) {
    var index = cart.indexWhere((p) => p['id'] == input['id']);
    if (index == -1) {
      input['total'] = input['qty'] * input['price'];
      cart.add(input);
    } else {
      cart[index]['qty'] = cart[index]['qty'] + 1;
      cart[index]['total'] = cart[index]['total'] + cart[index]['price'];
    }
    print(cart);
    cart.refresh();
  }

  removefromcart(input) {
    var index = cart.indexWhere((p) => p['id'] == input['id']);
    if (index == -1) {
      print('no present');
    } else {
      if (cart[index]['qty'] == 1) {
        cart.removeAt(index);
      } else {
        cart[index]['qty'] = cart[index]['qty'] - 1;
        cart[index]['total'] = cart[index]['total'] - cart[index]['price'];
      }
    }
    cart.refresh();
  }

  getTotalCartPrice() {
    num total = 0;
    cart.forEach((p) {
      total = total + (p['qty'] * p['price']);
    });
    return total;
  }

  getProductCount() {
    num count = 0;
    cart.forEach((p) {
      count = count + (p['qty']);
    });
    return count;
  }
}
