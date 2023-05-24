import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import '../../../../Helper/global_url.dart';
import '../../../../Helper/helper.dart';
import '../../../../Models/klima.dart';
import '../../../navigation_drawer/navigation.dart';

class KlimaPage extends StatefulWidget {
  int? selectedIndex;
  Klima? objekat;
  KlimaPage(this.selectedIndex, this.objekat, {super.key});

  @override
  State<KlimaPage> createState() => _KlimaPageState(selectedIndex, objekat);
}

class _KlimaPageState extends State<KlimaPage> {
  final _myBox = Hive.box("myBox");

  int? selectedIndex;
  Klima? objekat;
  _KlimaPageState(this.selectedIndex, this.objekat);
  var data = RoleUtil.getData();
  String time = DateFormat("hh:mm a").format(DateTime.now());
  String datum = DateFormat("EEEEE,dd MMMM yyyy").format(DateTime.now());
  int selected = 1;
  bool svic = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () => Navigator.pop(context),
          ),
          centerTitle: true,
          title: const Text("Smart home-temperature"),
          backgroundColor: const Color.fromARGB(255, 10, 21, 62),
        ),
        backgroundColor: const Color.fromARGB(255, 10, 21, 62),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 40,
                    left: MediaQuery.of(context).size.width * 0.05,
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    color: const Color.fromARGB(255, 28, 40, 80),
                    child: Row(
                      children: [
                        const Icon(Icons.ac_unit_rounded,
                            size: 70, color: Colors.white),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30),
                              child: Text(
                                  objekat == null
                                      ? "Choose AC"
                                      : objekat!.naziv,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text("Temperature",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Text(
                                      objekat == null
                                          ? "First choose AC"
                                          : objekat!.temperatura.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text("Fan speed",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Text(
                                      objekat == null
                                          ? "First choose device"
                                          : objekat!.brzinaPuhanja.toString(),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(30),
                                  child: Text("ON?",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(30),
                                  child: Text(
                                      objekat == null
                                          ? "First choose device"
                                          : objekat!.stanje == true
                                              ? "AC is ON"
                                              : "AC is OFF",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 15)),
                                ),
                                if (objekat != null)
                                  Switch(
                                    activeColor: Colors.amber,
                                    activeTrackColor: Colors.cyan,
                                    inactiveThumbColor:
                                        Colors.blueGrey.shade600,
                                    inactiveTrackColor: Colors.grey.shade400,
                                    splashRadius: 50.0,
                                    value: svic,
                                    // changes the state of the switch
                                    onChanged: (value) =>
                                        setState(() => svic = value),
                                  ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder<List<Klima>>(
                    future: fetch(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Expanded(
                          child: ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Card(
                                  child: InkWell(
                                onTap: () {
                                  setState(() {
                                    objekat = snapshot.data![index];
                                    selectedIndex = index;
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            KlimaPage(selectedIndex, objekat),
                                      ),
                                    );
                                  });
                                },
                                child: ListTile(
                                  tileColor:
                                      const Color.fromARGB(255, 200, 198, 213),
                                  leading: const Icon(
                                      Icons.perm_device_information,
                                      color: Color(0xfff8a55f)),
                                  title: Text(
                                      "Name: ${snapshot.data![index].naziv}"),
                                ),
                              ));
                            },
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text(snapshot.error.toString());
                      }
                      return const CircularProgressIndicator();
                    }),
              ],
            ),
          ],
        )),
        floatingActionButton: FloatingActionButton(
            heroTag: UniqueKey(),
            backgroundColor: const Color.fromARGB(255, 28, 40, 80),
            onPressed: () {
              dodajUredaj(context);
            },
            child: const Icon(Icons.add_outlined)));
  }

  dodajUredaj(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    TextEditingController nazivController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 36, 63, 158),
            title: const Text(
              "Add new device",
              style: TextStyle(color: Colors.white),
            ),
            content: Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 8,
                              child: TextFormField(
                                  controller: nazivController,
                                  decoration: const InputDecoration(
                                    icon: Icon(Icons.short_text),
                                    hintText: 'Enter name for device',
                                    labelText: 'Name',
                                  ),
                                  validator: (String? value) {
                                    return (value!.isEmpty)
                                        ? 'Enter the name for your device.'
                                        : null;
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )),
                TextButton(
                    child: const Text(
                      "SELECT",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (formKey.currentState!.validate()) {
                        addDevice(nazivController);
                      }
                    }),
              ],
            )));
  }
}

addDevice(nazivController) async {
  var data = RoleUtil.getData();
  final response = await http.post(Uri.parse('${GlobalUrl.url}Klima/Snimi'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': 0,
        'naziv': nazivController.text.toString(),
        'stanje': false,
        'temperatura': 25,
        'mod': "Cool",
        'brzinaPuhanja': 60,
        'homeId': data["kucaId"],
      }));
  return int.parse(response.body);
}

Future<List<Klima>> fetch() async {
  var data = RoleUtil.getData();
  var url =
      Uri.parse('${GlobalUrl.url}Klima/GetByHouse?homeId=${data["kucaId"]}');
  final response = await http.get(url);

  List jsonResponse = json.decode(response.body);
  return jsonResponse.map((report) => Klima.fromMap(report)).toList();
}

Future<Klima> fetchById(index) async {
  var data = RoleUtil.getData();
  var url = Uri.parse('${GlobalUrl.url}Klima/GetByHouse?id=${data["kucaId"]}');
  final response = await http.get(url);

  return Klima.fromMap(json.decode(response.body));
}
