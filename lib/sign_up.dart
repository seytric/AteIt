import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v1/api_requests.dart';
import 'package:v1/main_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String error_message = "";

  void validateSignUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    String server_response = await signUp(email, name, password);
    var json_response = jsonDecode(server_response);

    if (json_response.containsKey('error')) {
      String error = json_response['error'];
      print(error);
      setState(() {
        error_message = error;
      });
    } else {
      print(server_response);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(207, 38, 38, 38),
      ),
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Text(
                "AteIt",
                style: GoogleFonts.abrilFatface(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 100.0,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 220),
              child: TextFormField(
                autocorrect: false,
                style: const TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
                cursorColor: Colors.white,
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  labelStyle: TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 220),
              child: TextFormField(
                autocorrect: false,
                style: const TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
                cursorColor: Colors.white,
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 220),
              child: TextFormField(
                autocorrect: false,
                style: const TextStyle(color: Color.fromARGB(204, 255, 255, 255)),
                cursorColor: Colors.white,
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Color.fromARGB(140, 255, 255, 255)),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 15)),
            Padding(
              //button
              padding: const EdgeInsets.only(top: 20),
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(207, 43, 43, 43),
                child: MaterialButton(
                  minWidth: 250,
                  padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                  onPressed: () {
                    validateSignUp();
                  },
                  child: Text(
                    "Sign Up",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.alata(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              // error message
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                error_message,
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
