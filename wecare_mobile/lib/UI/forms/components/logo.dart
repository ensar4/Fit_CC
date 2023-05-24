import 'package:flutter/material.dart';

class Logo extends StatelessWidget{
  const Logo({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            left: 100
          ),
          child: const Icon(
            Icons.favorite_sharp,
              size: 50,
              color: Color.fromARGB(255, 201, 194, 202)
            ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.03,
            left: 20
          ),
          child: const Text("iCare",
            style: TextStyle(color: Color.fromARGB(255, 201, 194, 202), fontSize: 40)),
        )
      ],
    );
  }
}