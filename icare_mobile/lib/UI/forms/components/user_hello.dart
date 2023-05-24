import 'package:flutter/material.dart';

import '../../../Helper/helper.dart';

class UserHello extends StatelessWidget{
  final String time;
  final String datum;
  const UserHello(this.time, this.datum, {super.key});
  
  @override
  Widget build(BuildContext context) {
    var data = RoleUtil.getData();
    return SizedBox(
                  height: MediaQuery.of(context).size.height / 9,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //ime korisnika i pozdrav
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 20,
                            ),
                            child: Text(
                              "Hello ${data["ime"]} ${data["prezime"]}",
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                ),
                              ),
                          ),
                          const Text(
                              "Have a nice day",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                          )
                        ],
                      ),
                      //trenutno vrijeme
                      Column(
                        children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 20,
                          ),
                          child: Text(
                            time,
                            style: const TextStyle(color: Colors.white,),
                          ),
                        ),
                        Text(
                          datum,
                          style: const TextStyle(color: Colors.white,),
                        )
                      ]),
                    ],
                  ),
                );
  }
}