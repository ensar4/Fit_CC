import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icare_mobile/Helper/illness_text.dart';
import 'package:icare_mobile/UI/forms/components/health.dart';
import '../navigation_drawer/navigation.dart';

import 'package:intl/intl.dart';

import '../../Helper/helper.dart';

class AboutIllnesses extends StatefulWidget {
  const AboutIllnesses({super.key});

  @override
  State<AboutIllnesses> createState() => _AboutIllnessesState();
}

class _AboutIllnessesState extends State<AboutIllnesses> {
  final _myBox = Hive.box("myBox");

  _AboutIllnessesState();
  var data = RoleUtil.getData();
  String time = DateFormat("hh:mm a").format(DateTime.now());
  String datum = DateFormat("EEEEE,dd MMMM yyyy").format(DateTime.now());
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("About illnesses"),
        backgroundColor: const Color.fromARGB(255, 10, 21, 62),
      ),
      drawer: const NavigationMenu(),
      backgroundColor: const Color.fromARGB(255, 10, 21, 62),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 52, 77, 159),
                            border: Border.all(
                              color: const Color.fromARGB(255, 16, 28, 66),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18))),
                        child: const Center(
                            child: Text(
                          "Dementia",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 52, 77, 159),
                            border: Border.all(
                              color: const Color.fromARGB(255, 16, 28, 66),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18))),
                        child: const Center(
                            child: Text(
                          "Schizophrenia",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 7),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 52, 77, 159),
                            border: Border.all(
                              color: const Color.fromARGB(255, 16, 28, 66),
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(18))),
                        child: const Center(
                            child: Text(
                          "Parkinson's",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.03,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.73,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 16, 28, 66),
                  border: Border.all(
                    color: const Color.fromARGB(255, 16, 28, 66),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(18))),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Text(
                          IlnessText().GetText(selectedIndex),
                          style: TextStyle(color: Colors.white, fontSize: 20),
                          softWrap: true,
                          maxLines: 100,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
