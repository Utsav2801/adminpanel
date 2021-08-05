import 'package:flutter/material.dart';
import 'package:login_screen/signup_screen.dart';
import 'package:login_screen/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login_screen/utils/Constants.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Constants.prefs = await SharedPreferences.getInstance();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "LogIn Screen",
    home: Constants.prefs!.getBool("loggedIn") == true
      ? WelcomeScreen()
      : LoginPage(),
    theme: ThemeData(
      primaryColor: Color(0xFF15161D),
      accentColor: Colors.blueAccent,
      brightness: Brightness.dark,
    ),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}


class _LoginPageState extends State<LoginPage> {
  final loginkey =GlobalKey<FormState>();
  var userName,pass;
  String value = '';
  
  @override
  Widget build(BuildContext context) {
    String _password;
    return Scaffold(
      appBar: AppBar(
        actions :[
          //IconButton(icon: Icons.logout,)
        ],
        centerTitle: true,
        title: Text(
          "LogIn Page",
          style: TextStyle(
            color: Color(0xFF00D9b1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            Form(
              key: loginkey,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        labelText: "Username/Email",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF00D9B1),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF15161D)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF00D9B1)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      validator: (text){
                        if(text!.isEmpty){
                          return "Field can't be empty";
                        } else {
                          userName = text;
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20.0, right: 20.0, top: 50),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          fontSize: 15,
                          color: Color(0xFF00D9B1),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF15161D)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xFF00D9B1)),
                          borderRadius: BorderRadius.circular(60),
                        ),
                      ),
                      validator: (text){
                        if(text!.isEmpty){
                          return "Field can't be empty";
                        } else {
                          pass = text;
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
                        if( loginkey.currentState!.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
                        }
                        },
                      label: Text(
                        "LogIn",
                        style: TextStyle(fontSize: 20),
                      ),
                      backgroundColor: Color(0xFF514BFF),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: RaisedButton(
                      child: Text("Register",
                        style: TextStyle(color: Colors.white,),),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))),

                      onPressed: (){
                        Constants.prefs!.setBool("loggedIn" , true);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      color: Colors.transparent,
                    )
                  ),
                  Container(
                    child: Opacity(
                      opacity: 0.90,
                      child: Image.asset("assets/LoginScreenImage.png",),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    // TODO: implement build
    throw UnimplementedError();
  }
}
