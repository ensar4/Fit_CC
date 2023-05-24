import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icare_mobile/UI/forms/components/health.dart';
import '../navigation_drawer/navigation.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:intl/intl.dart';

import '../../Helper/helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box("myBox");
  late Timer _timer;
  final DBref = FirebaseDatabase.instance.ref();
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  _HomePageState();

  var data = RoleUtil.getData();
  String time = DateFormat("hh:mm a").format(DateTime.now());
  String datum = DateFormat("EEEEE,dd MMMM yyyy").format(DateTime.now());
  double longitude = 0.0;
  double latitude = 0.0;
  int selectedIndex = 1;

  late GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 10), (Timer t) {
      getGpsData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Health"),
        backgroundColor: const Color.fromARGB(255, 10, 21, 62),
      ),
      drawer: const NavigationMenu(),
      backgroundColor: const Color.fromARGB(255, 10, 21, 62),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Health(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 15.5,
                ),
                markers: {
                  Marker(
                    markerId: const MarkerId("marker1"),
                    position: _center,
                    draggable: false,
                    onDragEnd: (value) {
                      // value is the new position
                    },
                  ),
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // getRandNumber() {
  //   Random random = Random();
  //   setState(() {
  //     bpm = random.nextInt(30) + 60;
  //   });
  // }
  getGpsData() async {
    double long = 0.0;
    double lat = 0.0;
    await DBref.child('bracelet/lng').once().then((snapshot) {
      long = snapshot.snapshot.value as double;
    });
    await DBref.child('bracelet/lat').once().then((snapshot) {
      lat = snapshot.snapshot.value as double;
    });
    setState(() {
      longitude = long;
      latitude = lat;
      _center = LatLng(latitude, longitude);
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        bearing: 0,
        target: LatLng(latitude, longitude),
        zoom: 15.5,
      )));
    });
  }
}
