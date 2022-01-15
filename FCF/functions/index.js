/* eslint-disable require-jsdoc */
/* eslint-disable max-len */
const functions = require("firebase-functions");
const admin = require("firebase-admin");

admin.initializeApp();

exports.onOrderCreate = functions.firestore
    .document("orders/{orderId}")
    .onCreate((res, context) => {
      const order = res.data();
      console.log(order);

      return admin
          .firestore()
          .collection("settings")
          .doc("store")
          .get()
          .then((res) => {
            console.log(res.data());
            const token = res.data().pushToken;
            return sendMessage(
                token,
                "New Order Received",
                "Total Items: " + order.itemCount + " Value:" + order.cartTotal
            );
          })
          .catch((e) => {
            return false;
          });
    });

exports.onOrderComplete = functions.firestore
    .document("orders/{orderId}")
    .onUpdate((res, context) => {
      const order = res.after.data();
      console.log(order);
      if (order.status == "COMPLETED") {
        return admin
            .firestore()
            .collection("accounts")
            .doc(order.userId)
            .get()
            .then((res) => {
              console.log(res.data());
              const token = res.data().pushToken;
              return sendMessage(
                  token,
                  "Your Order is Completed!",
                  "Total Items: " + order.itemCount + " Value:" + order.cartTotal
              );
            })
            .catch((e) => {
              return false;
            });
      } else {
        return false;
      }
    });

function sendMessage(token, title, message) {
  return admin.messaging().sendToDevice(token, {
    notification: {
      title: title,
      body: message,
      sound: "default",
    },
  });
}
