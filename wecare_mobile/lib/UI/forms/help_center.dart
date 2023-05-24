import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../navigation_drawer/navigation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:intl/intl.dart';

import '../../Helper/helper.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final _myBox = Hive.box("myBox");

  _HelpCenterState();
  var data = RoleUtil.getData();
  String time = DateFormat("hh:mm a").format(DateTime.now());
  String datum = DateFormat("EEEEE,dd MMMM yyyy").format(DateTime.now());
  int selectedIndex = 0;
  bool questionNo1 = false;
  bool questionNo2 = false;
  bool questionNo3 = false;
  bool questionNo4 = false;
  bool questionNo5 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Help center"),
          backgroundColor: const Color.fromARGB(255, 10, 21, 62),
        ),
        drawer: const NavigationMenu(),
        backgroundColor: const Color.fromARGB(255, 10, 21, 62),
        body: SingleChildScrollView(
          child: Column(
            children: [
              //faq
              if (selectedIndex == 0)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 16, 28, 66),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "FAQ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Center(
                            child: Text(
                              "Contact us",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              //contact us
              if (selectedIndex == 1)
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.08,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 0;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: const Center(
                            child: Text(
                              "FAQ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            selectedIndex = 1;
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 16, 28, 66),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              "Contact us",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              //faq
              if (selectedIndex == 0)
                SingleChildScrollView(
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 28, 66),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 11, 16, 32),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: ExpansionTile(
                                leading: const Icon(Icons.question_mark,
                                    color: Colors.white),
                                title: const Text(
                                  'Question No.1',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                trailing: Icon(
                                  color: Colors.white,
                                  questionNo1
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 17, 31, 76),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 11, 16, 32),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Text(
                                              "Answer No.1",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              softWrap: true,
                                              maxLines: 100,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(() => questionNo1 = expanded);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 28, 66),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 11, 16, 32),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: ExpansionTile(
                                leading: const Icon(Icons.question_mark,
                                    color: Colors.white),
                                title: const Text(
                                  'Question No.2',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                trailing: Icon(
                                  color: Colors.white,
                                  questionNo2
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 17, 31, 76),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 11, 16, 32),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Text(
                                              "Answer No.2",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              softWrap: true,
                                              maxLines: 100,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(() => questionNo2 = expanded);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 28, 66),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 11, 16, 32),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: ExpansionTile(
                                leading: const Icon(Icons.question_mark,
                                    color: Colors.white),
                                title: const Text(
                                  'Question No.3',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                trailing: Icon(
                                  color: Colors.white,
                                  questionNo3
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 17, 31, 76),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 11, 16, 32),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Text(
                                              "Answer No.3",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              softWrap: true,
                                              maxLines: 100,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(() => questionNo3 = expanded);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 28, 66),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 11, 16, 32),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: ExpansionTile(
                                leading: const Icon(Icons.question_mark,
                                    color: Colors.white),
                                title: const Text(
                                  'Question No.4',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                trailing: Icon(
                                  color: Colors.white,
                                  questionNo4
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 17, 31, 76),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 11, 16, 32),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Text(
                                              "Answer No.4",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              softWrap: true,
                                              maxLines: 100,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(() => questionNo4 = expanded);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 16, 28, 66),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 11, 16, 32),
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(12),
                                ),
                              ),
                              child: ExpansionTile(
                                leading: const Icon(Icons.question_mark,
                                    color: Colors.white),
                                title: const Text(
                                  'Question No.5',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                trailing: Icon(
                                  color: Colors.white,
                                  questionNo5
                                      ? Icons.arrow_drop_up
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(255, 17, 31, 76),
                                      border: Border.all(
                                        color: const Color.fromARGB(
                                            255, 11, 16, 32),
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Row(
                                      children: const [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(18),
                                            child: Text(
                                              "Answer No.5",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                              softWrap: true,
                                              maxLines: 100,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(() => questionNo5 = expanded);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              //contact us
              if (selectedIndex == 1)
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 16, 28, 66),
                              border: Border.all(
                                color: const Color.fromARGB(255, 11, 16, 32),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.headphones,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Customer service",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 16, 28, 66),
                              border: Border.all(
                                color: const Color.fromARGB(255, 11, 16, 32),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.instagram,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Instagram",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 16, 28, 66),
                              border: Border.all(
                                color: const Color.fromARGB(255, 11, 16, 32),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.facebook,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Facebook",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 16, 28, 66),
                              border: Border.all(
                                color: const Color.fromARGB(255, 11, 16, 32),
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  FontAwesomeIcons.globe,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15),
                                  child: Text(
                                    "Website",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
