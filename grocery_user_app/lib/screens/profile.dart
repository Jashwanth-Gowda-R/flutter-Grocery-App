// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/screens/login.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  FirebaseFirestore _db = FirebaseFirestore.instance;

  FirebaseStorage _storage = FirebaseStorage.instance;

  TextEditingController emailField = TextEditingController();
  TextEditingController nameField = TextEditingController();
  TextEditingController mobileField = TextEditingController();

  var profileImage = 'http://placehold.it/120x120';

  logout() {
    _auth
        .signOut()
        .then(
          (value) => Get.offAll(LoginScreen()),
        )
        .catchError((e) {
      Get.showSnackbar(GetBar(
        message: e.toString(),
        duration: Duration(seconds: 5),
      ));
    });
  }

  readUserDetails() {
    _db
        .collection('accounts')
        .doc(_auth.currentUser.uid)
        .snapshots()
        .listen((res) {
      print(res);
      print(res.id);
      print(res.data());
      setState(() {
        nameField.text = res.data()['name'];
        mobileField.text = res.data()['phoneNumber'];
        emailField.text = res.data()['email'];
        profileImage = res.data()['imageURL'];
      });
    });
  }

  updateUserDetails() {
    _db.collection('accounts').doc(_auth.currentUser.uid).update({
      "name": nameField.text,
      "phoneNumber": mobileField.text,
      "email": emailField.text,
    }).then((res) {
      Get.back();
      print("updated user details");
    }).catchError((e) {
      print(e);
    });
  }

  uploadUserProfileImage() async {
    var picker = ImagePicker();
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile.path.length != null) {
      File image = File(pickedFile.path);
      _storage
          .ref()
          .child('user')
          .child(_auth.currentUser.uid)
          .putFile(image)
          .then((res) {
        print(res);
        res.ref.getDownloadURL().then((url) {
          print('uploadedm url' + url);
          _db.collection('accounts').doc(_auth.currentUser.uid).update({
            "imageURL": url,
          }).then((res) {
            print("updated store image url details");
          }).catchError((e) {
            print(e);
          });
        });
      }).catchError((e) => {print(e)});
    } else {
      print('no file picked!');
    }
  }

  @override
  void initState() {
    super.initState();
    readUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text(
          "Edit Profile",
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    uploadUserProfileImage();
                  },
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(profileImage),
                    radius: 60,
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: nameField,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Full Name",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: mobileField,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: InputBorder.none,
                    labelText: "Phone Number",
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                // TextField(
                //   controller: emailField,
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.grey[200],
                //     border: InputBorder.none,
                //     labelText: "Email Address",
                //   ),
                // ),
                // SizedBox(
                //   height: 8,
                // ),
                // TextField(
                //   decoration: InputDecoration(
                //     filled: true,
                //     fillColor: Colors.grey[200],
                //     border: InputBorder.none,
                //     labelText: "Password",
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      updateUserDetails();
                    },
                    child: Text('Save Changes'),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                    onPressed: () {
                      logout();
                      // Get.offAll(LoginScreen());
                    },
                    child: Text('Logout'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
