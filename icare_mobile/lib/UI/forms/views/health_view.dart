import 'package:flutter/material.dart';

import '../../navigation_drawer/navigation.dart';
import '../devices/health/klima_page.dart';
import '../devices/health/prociscivac_page.dart';
import '../devices/health/usisivac_page.dart';

class HealthPage extends StatelessWidget{
  const HealthPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        centerTitle: true,
        title: const Text("Smart home-health"),
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
                                            builder: (context) => KlimaPage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon( Icons.ac_unit,size: 30, color: Colors.white),
                                            title: Text("Temperature",
                                                        style: TextStyle(color: Colors.white, fontSize: 30)),
                                            trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                                          ),
                                        ),
                                        InkWell(
                                           onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => UsisivacPage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon( Icons.cleaning_services, size: 30, color: Colors.white),
                                            title: Text("Vacuum cleaner",
                                                        style: TextStyle(color: Colors.white, fontSize: 30)),
                                            trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => ProciscivacPage(null, null),
                                          ),
                                        );
                                      },
                                          child: const ListTile(
                                            leading: Icon( Icons.air, size: 30, color: Colors.white),
                                            title: Text("Air refreshener",
                                                        style: TextStyle(color: Colors.white, fontSize: 30)),
                                            trailing: Icon(Icons.arrow_right, size: 30,color: Colors.white,),
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