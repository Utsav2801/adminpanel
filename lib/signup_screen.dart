import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/log_in_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _SignUpScreenState extends State<SignUpScreen> {
  var formKey = GlobalKey<FormState>();
  late var firstName, mobNum, email, pass, confPass = "";
  TextEditingController _password = TextEditingController();
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: TextStyle(color: Color(0xFF00D9b1), fontSize: 25),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    print(_hasError);

                    if (_hasError) {
                      setState(() {
                        _hasError = false;
                      });
                    }
                  },
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      labelText: "First Name",
                      labelStyle: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF00D9B1),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFF00D9B1)),
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "Feild can't be empty";
                      } else {
                        firstName = text;
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: TextFormField(
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF00D9B1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF15161D)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF00D9B1)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Feild can't be empty";
                    } else {
                      mobNum = int.parse(text);
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "yourname@gmail.com",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF00D9B1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF15161D)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF00D9B1)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Feild can't be empty";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text)) {
                      return "invalid email format";
                    } else {
                      email = text;
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: TextFormField(
                  obscureText: true,
                  controller: _password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF00D9B1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF15161D)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF00D9B1)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Field can't be empty";
                    } else {
                      pass = text;
                      return null;
                    }
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                child: TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: "Confirm",
                    hintText: "Confirm Password",
                    labelStyle: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF00D9B1),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF15161D)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFF00D9B1)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (text) {
                    if (text!.isEmpty) {
                      return "Field can't be empty";
                    } else if (text != _password.text) {
                      return "password does not match";
                    } else {
                      confPass = text;
                      return null;
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 50),
                width: 250,
                child: FloatingActionButton.extended(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  },
                  label: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                  ),
                  backgroundColor: Color(0xFF514BFF),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}
