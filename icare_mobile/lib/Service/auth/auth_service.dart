import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../Helper/global_url.dart';



class AuthService {
  static Future login(
      TextEditingController usernameController, TextEditingController passwordController) async {
    final personDetails = await http.post(Uri.parse('${GlobalUrl.url}Korisnik/Login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'username': usernameController.text.toString(),
          'password': passwordController.text.toString(),
        }));
    return personDetails.body;
  }

  static Future homeRegistration(
    TextEditingController nazivController,
    TextEditingController adresaController) async{
        final response = await http.post(Uri.parse('${GlobalUrl.url}Home/Snimi'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': 0,
          'naziv': nazivController.text.toString(),
          'adresa': adresaController.text.toString(),
        }));
    return int.parse(response.body);
    }

  static Future userRegistration(
      TextEditingController firstNameController,
      TextEditingController lastNameController,
      TextEditingController usernameController,
      TextEditingController passwordController,
      TextEditingController mailController,
      int kucaId) async {
    final response = await http.post(Uri.parse('${GlobalUrl.url}Korisnik/Snimi'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': 0,
          'ime': firstNameController.text.toString(),
          'prezime': lastNameController.text.toString(),
          'username': usernameController.text.toString(),
          'password': passwordController.text.toString(),
          'mail': mailController.text.toString(),
          'kucaId': kucaId
        }));

    return response;
  }

}
