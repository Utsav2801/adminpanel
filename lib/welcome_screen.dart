import 'package:flutter/material.dart';
import 'package:login_screen/main.dart';
import 'package:login_screen/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Dashboard",
                     style:TextStyle(color: Color(0xFF00D9B1),
                     fontSize: 30)),
      ),
      body:  Container(
        child: Center(
            child: Text("Welcome to Admin Panel",
              style: TextStyle(color: Color(0xFF00D9B1),
                  fontSize: 30),)
        ),
      ),
        drawer: Drawer(
    child: ListView(
      children: [
        Container(
          child: DrawerHeader(
            child: CircleAvatar(
              backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTOkHm3_mPQ5PPRvGtU6Si7FJg8DVDtZ47rw&usqp=CAU"),
              radius: 5,
    ),
            decoration: BoxDecoration(
              color: Color(0xFF111320),
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10),
          tileColor: Color(0xFF111320),
          leading: Icon(Icons.person_outlined,
            size: 30, color: Colors.white,),
          title: Text("My Account", style: TextStyle(
            color:  Color(0xFF00D9B1),)),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10),
          tileColor: Color(0xFF111320),
          leading: Icon(Icons.settings_outlined,
            size: 30, color: Colors.white,),
          title: Text("Settings", style: TextStyle(
            color: Color(0xFF00D9B1),)),
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          tileColor: Color(0xFF111320),
          leading: Icon(Icons.logout_outlined,
            size: 30, color: Colors.white,),
          title: Text("Log out", style: TextStyle(
            color: Color(0xFF00D9B1),)),
        ),
      ],
    ),
    ),
    );
  }
}
