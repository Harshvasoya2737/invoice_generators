import 'package:flutter/material.dart';
import 'Home_page.dart';
import 'pdf.dart';
import 'splash_screen.dart';
import 'login.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      routes: {
        "splash_screen": (context) => Splash_screen(),
        "home": (context) => InvoiceGenerator(),
        "homepage": (context) => homepage(),
        "my_pdf": (context) => Mypdf(),
      },
    );
  }
}
