import 'package:flutter/material.dart';

import '../../Service/auth/auth_service.dart';
import '../Background/background.dart';
import 'login_page.dart';




class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final  _nazivController = TextEditingController();
  final  _adresaController = TextEditingController();
  final  _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const Background(),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 55),
              child: const Text(
                "Register",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color:Colors.white
                ),
              ),
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: 350,
                child: Stack(
                  children: [
                    Form(
                      key: _formKey,
                      child: Container(
                        margin: const EdgeInsets.only(right: 70),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 0,
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _firstNameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter First Name";
                                  } else {
                                    return value.trim().length < 3
                                        ? 'Minimum character length is 3'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.person),
                                  hintText: "First Name",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _lastNameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter Last Name";
                                  } else {
                                    return value.trim().length < 3
                                        ? 'Minimum character length is 3'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.person),
                                  hintText: "Last Name",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _usernameController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter Username";
                                  } else {
                                    return value.trim().length < 5
                                        ? 'Minimum character length is 5'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.account_circle_rounded),
                                  hintText: "Username",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _passwordController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter Password";
                                  } else {
                                    return value.trim().length < 5
                                        ? 'Minimum character length is 5'
                                        : null;
                                  }
                                },
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.lock),
                                  hintText: "Password",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _emailController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter Email";
                                  } else {
                                    return value.trim().length < 5
                                        ? 'Minimum character length is 5'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.email),
                                  hintText: "Email",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _nazivController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter home name";
                                  } else {
                                    return value.trim().length < 5
                                        ? 'Minimum character length is 5'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.home),
                                  hintText: "Home name",
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(left: 16, right: 32),
                              child: TextFormField(
                                controller: _adresaController,
                                validator: (value) {
                                  if (value!.trim().isEmpty) {
                                    return "Enter adress";
                                  } else {
                                    return value.trim().length < 5
                                        ? 'Minimum character length is 5'
                                        : null;
                                  }
                                },
                                decoration: const InputDecoration(
                                  hintStyle: TextStyle(fontSize: 16),
                                  border: InputBorder.none,
                                  icon: Icon(Icons.home),
                                  hintText: "Adress",
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        margin: const EdgeInsets.only(right: 15),
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.green[200]!.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff1bccba),
                              Color(0xff22e2ab),
                            ],
                          ),
                        ),
                        child: InkWell(
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              var kucaId = await AuthService.homeRegistration(_nazivController, _adresaController);
                              var statusCode = 
                                   AuthService.userRegistration(
                                   _firstNameController, 
                                   _lastNameController, 
                                   _usernameController, 
                                   _passwordController,
                                   _emailController,
                                   kucaId);
                               Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const LoginForm(),
                                  ));
                            }
                          },
                          child: const Icon(
                            Icons.arrow_forward_outlined,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, top: 24),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginForm(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Color(0xffe98f60),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
