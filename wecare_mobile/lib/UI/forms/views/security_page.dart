
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../../Helper/helper.dart';
import '../../navigation_drawer/navigation.dart';
import '../devices/security/doors_page.dart';
import '../devices/security/windows_page.dart';
import 'electrical_page.dart';
import 'health_view.dart';


class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
    final _myBox = Hive.box("myBox");

  _SecurityPageState();
  var data = RoleUtil.getData();
  String time =  DateFormat("hh:mm a").format(DateTime.now());
  String datum = DateFormat("EEEEE,dd MMMM yyyy").format(DateTime.now());
  String selected = "Health";
  int bpm = 60;
  int pritisakGornji = 120;
  int pritisakDonji = 80;


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Smart home-security"),
        backgroundColor: const Color.fromARGB(255, 10, 21, 62),  
      ),
      drawer: const NavigationMenu(),
      backgroundColor: const Color.fromARGB(255, 10, 21, 62),
      body: SingleChildScrollView(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width *0.05,
                                  top: MediaQuery.of(context).size.height *0.05
                                  ),
                                child: Container(
                                                    width: MediaQuery.of(context).size.width *0.9,
                                                    height: MediaQuery.of(context).size.height *0.8,
                                                    decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 16, 28, 66),
                                border: Border.all(
                                  color: const Color.fromARGB(255, 16, 28, 66),
                                ),
                                borderRadius: const BorderRadius.all(Radius.circular(18))
                                                          ),
                                                    child: Column(
                                                      children: [
                                                         Expanded(
                                 child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => DoorsPage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon(  Icons.door_front_door,size: 40, color: Colors.white),
                                            title: Text("Doors",
                                                        style: TextStyle(color: Colors.white, fontSize: 40)),
                                            trailing: Icon(Icons.arrow_right, size: 40,color: Colors.white,),
                                          ),
                                        ),
                                        InkWell(
                                           onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => WindowPage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon( Icons.window, size: 40, color: Colors.white),
                                            title: Text("Windows",
                                                        style: TextStyle(color: Colors.white, fontSize: 40)),
                                            trailing: Icon(Icons.arrow_right, size: 40,color: Colors.white,),
                                          ),
                                        ),
                                      ],  
                                                            ),
                                 ),
                                                      ],
                                                    ),
                                                  ),
                              ),
                            ],
                          ),
                        ),
    );
  }
}