// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocery_user_app/controller/address.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class ManageAddress extends StatefulWidget {
  bool canedit = false;
  var address = {};
  ManageAddress({this.canedit, this.address});

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  TextEditingController _tagfield = TextEditingController();
  TextEditingController _namefield = TextEditingController();
  TextEditingController _mobilefield = TextEditingController();
  TextEditingController _addressfield = TextEditingController();
  TextEditingController _pincodefield = TextEditingController();

  AddressController _addressCtrl = Get.put(AddressController());

  Completer<GoogleMapController> _controller = Completer();
  double _lat = 12.9716;
  double _lng = 77.5946;

  @override
  void initState() {
    super.initState();
    _tagfield.text = widget.address['tag'];
    _namefield.text = widget.address['name'];
    _mobilefield.text = widget.address['mobile'];
    _addressfield.text = widget.address['address'];
    _pincodefield.text = widget.address['pincode'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.canedit ? "Update Address" : 'Add Address'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // child: Image.asset(
              //   'assets/images/map.png',
              //   fit: BoxFit.cover,
              // ),
              // width: double.infinity,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(_lat, _lng),
                  zoom: 12,
                ),
                onMapCreated: (res) {
                  _controller.complete(res);
                  // fetchMyLocation();
                },
              ),
              height: 280,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _tagfield,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        labelText: "Tag(Eg:Home,Office)",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _namefield,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        labelText: "Name",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _mobilefield,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        labelText: "Mobile Number",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      maxLines: 5,
                      controller: _addressfield,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        labelText: "Address",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    TextField(
                      controller: _pincodefield,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: InputBorder.none,
                        labelText: "pincode",
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          widget.canedit
                              ? _addressCtrl
                                  .updateAddress(widget.address['id'], {
                                  "tag": _tagfield.text,
                                  "name": _namefield.text,
                                  "mobile": _mobilefield.text,
                                  "address": _addressfield.text,
                                  "pincode": _pincodefield.text
                                })
                              : _addressCtrl.addAddress({
                                  "tag": _tagfield.text,
                                  "name": _namefield.text,
                                  "mobile": _mobilefield.text,
                                  "address": _addressfield.text,
                                  "pincode": _pincodefield.text
                                });
                        },
                        child: Text('Save Changes'),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
