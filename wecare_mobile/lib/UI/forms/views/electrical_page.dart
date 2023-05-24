
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import '../../../Helper/helper.dart';
import '../../navigation_drawer/navigation.dart';
import '../devices/electricity/iron_page.dart';
import '../devices/electricity/kettle_page.dart';
import 'health_view.dart';
import 'security_page.dart';


class ElectricalPage extends StatefulWidget {
  const ElectricalPage({super.key});

  @override
  State<ElectricalPage> createState() => _ElectricalPageState();
}

class _ElectricalPageState extends State<ElectricalPage> {
    final _myBox = Hive.box("myBox");

  _ElectricalPageState();
  var data = RoleUtil.getData();
  String time =  DateFormat("hh:mm a").format(DateTime.now());
  String datum = DateFormat("EEEEE,dd MMMM yyyy").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
  var itemWidth = MediaQuery.of(context).size.width * 0.2;
  var itemHeight = MediaQuery.of(context).size.height * 0.2;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 10, 21, 62),
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Smart home-electricity"),
        backgroundColor: const Color.fromARGB(255, 10, 21, 62),  
      ),
      drawer: const NavigationMenu(),
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
                                            builder: (context) => KettlePage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon( Icons.soup_kitchen,size: 40, color: Colors.white),
                                            title: Text("Kettle",
                                                        style: TextStyle(color: Colors.white, fontSize: 40)),
                                            trailing: Icon(Icons.arrow_right, size: 40,color: Colors.white,),
                                          ),
                                        ),
                                        InkWell(
                                           onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => IronPage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon( Icons.iron, size: 40, color: Colors.white),
                                            title: Text("Iron",
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