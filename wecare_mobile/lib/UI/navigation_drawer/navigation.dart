import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:icare_mobile/UI/forms/about_illnessess.dart';
import 'package:icare_mobile/UI/forms/help_center.dart';
import 'package:icare_mobile/UI/forms/home_page.dart';
import 'package:icare_mobile/UI/forms/views/electrical_page.dart';
import 'package:icare_mobile/UI/forms/views/health_view.dart';
import 'package:icare_mobile/UI/forms/views/security_page.dart';

import '../../Helper/helper.dart';
import '../forms/login_page.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigatiomMenuState();
}

class _NavigatiomMenuState extends State<NavigationMenu> {
  final _myBox = Hive.box("myBox");
  bool _customTileExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 16, 28, 66),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) => Container();

  Widget buildMenuItems(BuildContext context) => Container(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 16, 28, 66)),
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 5,
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.white),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15, top: 15),
                child: Image.asset(
                  "assets/images/weCareLogo.png",
                  height: 200,
                  width: 300,
                ),
              ),
            ),
            ListTile(
                leading: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                ),
                title: const Text(
                  'Health',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HomePage()));
                }),
            ListTile(
              leading: const Icon(
                Icons.person,
                color: Colors.white,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                //   Navigator.pop(context);

                //   Navigator.of(context).pushReplacement(
                //       MaterialPageRoute(builder: (context) => const UserForm()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.medical_services,
                color: Colors.white,
              ),
              title: const Text(
                'About illnesses',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);

                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AboutIllnesses()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              title: const Text(
                'About us',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Navigator.pop(context);

                // Navigator.of(context).pushReplacement(
                //     MaterialPageRoute(builder: (context) => const MyReport()));
              },
            ),
            ListTile(
                leading: const Icon(
                  Icons.question_answer,
                  color: Colors.white,
                ),
                title: const Text(
                  'Help center',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const HelpCenter()));
                }),
            ExpansionTile(
              leading: const Icon(Icons.smart_screen, color: Colors.white),
              title: const Text('Smart home',
                  style: TextStyle(color: Colors.white)),
              trailing: Icon(
                color: Colors.white,
                _customTileExpanded
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down,
              ),
              children: <Widget>[
                ListTile(
                  leading: const Icon(
                    Icons.monitor_heart,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Health',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Navigator.pop(context);

                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) => const HealthPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.security,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Security',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Navigator.pop(context);

                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) => const SecurityPage()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.power,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Electricity',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {
                    // Navigator.pop(context);

                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) => const ElectricalPage()));
                  },
                ),
              ],
              onExpansionChanged: (bool expanded) {
                setState(() => _customTileExpanded = expanded);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                _myBox.clear();
                RoleUtil.deleteDataFromBox();
                Navigator.of(context).pop();

                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => const LoginForm()));
              },
            ),
          ],
        ),
      );
}
