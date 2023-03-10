import 'package:flutter/material.dart';
import 'package:v1/log_in.dart';
import 'package:v1/main_page.dart';
import 'package:v1/sign_up.dart';
import 'package:v1/welcome.dart';

void main() => runApp(
      MaterialApp(
        title: "AteIt v1",
        home: const Welcome(),
        theme: ThemeData(
          scaffoldBackgroundColor: Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
