import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Account Info.",
          style: TextStyle(color: Color(0xFF00D9B1), fontSize: 30),
        ),
      ),
      body: SizedBox(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(2)),
                SizedBox(
                  height: 200,
                  width: double.maxFinite,
                  child: Card(
                    color: Color(0xFF15161D),
                    elevation: 10.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 110),
                      child: Row(
                        children: [
                          Text(
                            "Name : ",
                            style: GoogleFonts.kulimPark(
                                fontStyle: FontStyle.normal,
                                color: Color(0xFF00D9B1),
                                fontSize: 16),
                          ),
                          Text(
                            "Jethalal Champaklal Gada",
                            style: GoogleFonts.kulimPark(
                                fontStyle: FontStyle.normal,
                                color: Colors.white,
                                fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
