import 'package:flutter/material.dart';
import 'package:invoice_generators/pdf_screen.dart';

class Mypdf extends StatefulWidget {
  const Mypdf({super.key});

  @override
  State<Mypdf> createState() => _MypdfState();
}

class _MypdfState extends State<Mypdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.cyan,
          title: Text(
            "INVOICE PDF",
            style: TextStyle(color: Colors.white),
          ),
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ))),
      body: PdfData().getPdfPreview(),
    );
  }
}
