import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Health extends StatefulWidget {
  const Health({super.key});

  @override
  State<Health> createState() => _HealthState();
}

class _HealthState extends State<Health> {
  final DBref = FirebaseDatabase.instance.ref();
  late Timer _timer;
  @override
  void dispose() {
    _timer.cancel();
    Health();
    super.dispose();
  }

  _HealthState();
  int bpm = 60;
  int detektovanPad = 0;
  bool panik = true;
  @override
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      getHealthData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            top: MediaQuery.of(context).size.height * 0.05,
          ),
          child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.75,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 16, 28, 66),
                  border: Border.all(
                    color: const Color.fromARGB(255, 16, 28, 66),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(18))),
              child: Center(
                  child: Column(
                children: [
                  if (panik == false)
                    const Padding(
                      padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: Text(
                        "Panic is off",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  if (panik == true)
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: Column(
                        children: [
                          const Text(
                            "Panic is ON",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  panik = false;
                                });
                              },
                              child: const Text("Turn off"))
                        ],
                      ),
                    ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Container(
                      decoration: const BoxDecoration(
                          border: BorderDirectional(
                              bottom:
                                  BorderSide(color: Colors.white, width: 1))),
                      child: Row(children: [
                        const Icon(Icons.trending_up,
                            size: 60, color: Color.fromARGB(255, 180, 0, 0)),
                        Column(
                          children: [
                            const Text(
                              "Heart rate",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 180, 0, 0)),
                            ),
                            Text(
                              "$bpm bPm",
                              style: const TextStyle(
                                  fontSize: 19, color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 80),
                    child: Container(
                      decoration: const BoxDecoration(
                          border: BorderDirectional(
                              bottom:
                                  BorderSide(color: Colors.white, width: 1))),
                      child: Row(children: [
                        const Icon(Icons.personal_injury,
                            size: 60, color: Color.fromARGB(255, 170, 139, 26)),
                        Column(
                          children: [
                            const Text(
                              "Fall sensor",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 170, 139, 26)),
                            ),
                            Text(
                              detektovanPad == 1 ? "True" : "False",
                              style: const TextStyle(
                                  fontSize: 19, color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, top: 40),
                    child: Container(
                      decoration: const BoxDecoration(
                          border: BorderDirectional(
                              bottom:
                                  BorderSide(color: Colors.white, width: 1))),
                      child: Row(children: [
                        const Icon(Icons.smoke_free,
                            size: 60, color: Color.fromARGB(255, 170, 139, 26)),
                        Column(
                          children: const [
                            Text(
                              "Smoke detector",
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Color.fromARGB(255, 170, 139, 26)),
                            ),
                            Text(
                              "False",
                              style:
                                  TextStyle(fontSize: 19, color: Colors.white),
                            ),
                          ],
                        )
                      ]),
                    ),
                  ),
                ],
              ))),
        ),
      ],
    );
  }

  getHealthData() async {
    int pulse = 0;
    int pad = 0;
    await DBref.child('bracelet/pulse').once().then((snapshot) {
      pulse = snapshot.snapshot.value as int;
    });
    await DBref.child('bracelet/detektovanPad').once().then((snapshot) {
      pad = snapshot.snapshot.value as int;
    });
    setState(() {
      bpm = pulse;
      detektovanPad = pad;
    });
  }
}
