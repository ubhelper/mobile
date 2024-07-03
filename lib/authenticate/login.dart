import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'forgot.dart';
import '../maps/map.dart';
import '../authenticate/register.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPageWidgets(title: 'Personal Assistant'),
    );
  }
}

class LoginPageWidgets extends StatefulWidget {
  const LoginPageWidgets({super.key, required this.title});
  final String title;

  @override
  State<LoginPageWidgets> createState() => _LoginPageWidgetsState();
}

class _LoginPageWidgetsState extends State<LoginPageWidgets> {

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  void _login () async {
    if (_phoneController.text == '' || _passwordController.text == '') {
      return;
    }

    final response = await http.post(
      Uri.parse(dotenv.env['APP_URL']! + '/v1/user/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'phone': _phoneController.text,
        'password': _passwordController.text
      }),
    );


    if (response.statusCode != 200) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Нэвтрэх'),
          content: const Text('Хэрэглэгчийн нэр эсвэл нууц үг буруу'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('За, Ойлголоо'),
            ),
          ],
        ),
      );

      return;
    }

    final Map parsed = json.decode(response.body);
    final data = parsed['data'];

    SharedPreferences.setMockInitialValues({});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', data['token']);
    prefs.setString('user', json.encode(data));

    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MapApp())
    );
  }
  void _forgot() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ForgotPasswordPage())
    );
  }

  void f_register() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const RegisterApp())
    );
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //       image: AssetImage("assets/images/home_bg.jpg"),
          //   ),
          // ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Image(
                  image: new AssetImage('assets/images/home_bg.jpg'),
                  width: size.width,
                  height: size.height,
                  fit: BoxFit.cover,
                )
              ),
              Positioned(
                width: size.width,
                height: size.height,
                child: Container(
                    color: const Color(0x1E319D).withOpacity(.8),
                    child: Container(
                      margin: const EdgeInsets.only(left: 50.0, right: 50, top: 200),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget> [
                          // Image(image: AssetImage("assets/images/logo_white.png"), width: 120, fit: BoxFit.fill, ),
                          // SizedBox(height: 40),
                          Container(
                            decoration: BoxDecoration(
                              // color: const Color(0x3B4381),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, .3),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(3, 4))
                                ]
                            ),
                            child: TextField(
                              controller: _phoneController,
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontSize: size.width/25),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Утасны дугаар',
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.only(left: 30.0, bottom: 15, top: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            decoration: BoxDecoration(
                              // color: const Color(0x3B4381),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                boxShadow: [
                                  BoxShadow(color: Color.fromRGBO(0, 0, 0, .3),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(3, 4))
                                ]
                            ),
                            child: TextField(
                              controller: _passwordController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              style: TextStyle(fontSize: size.width/25),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Нууц үг',
                                fillColor: Colors.white,
                                filled: true,
                                contentPadding: const EdgeInsets.only(left: 30.0, bottom: 15, top: 15),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)
                                ),
                              ),
                            ),
                          ),
                          // SizedBox(height: 10),
                          TextButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  "Нууц үгээ мартсан уу?",
                                  style: TextStyle(
                                    height: 1.0,
                                    fontSize: size.width / 25,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            onPressed: _forgot,
                          ),
                          // SizedBox(height: 10),
                          Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromRGBO(59, 67, 129, 1),
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                  boxShadow: [
                                    BoxShadow(color: Color.fromRGBO(0, 0, 0, .3),
                                        spreadRadius: 1,
                                        blurRadius: 1,
                                        offset: Offset(3, 4))
                                  ]
                              ),
                              child: ButtonTheme(
                                child: TextButton(
                                  style: ButtonStyle(
                                    // padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(top: 25, bottom: 25, left: 30, right: 30)),
                                    backgroundColor: MaterialStateProperty.all<Color>(const Color.fromRGBO(59, 67, 129, 1.0)),
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                          // side: BorderSide(color: Colors.red),
                                        )
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        "Үргэлжлүүлэх",
                                        style: TextStyle(
                                          height: 1.0,
                                          fontSize: size.width/22,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                  onPressed: _login,
                                ),
                              )
                          ),
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                  margin: const EdgeInsets.only(top: 200),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Та бүртгэлгүй юу?",
                                        style: TextStyle(
                                          height: 1.0,
                                          fontSize: size.width/25,
                                          color: Colors.white,
                                        ),
                                      ),
                                      TextButton(
                                        child: Text(
                                          "Бүртгүүлэх",
                                          style: TextStyle(
                                            height: 1.0,
                                            fontSize: size.width/25,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                        ),
                                        onPressed: f_register,
                                      )
                                    ],
                                  )
                              )
                          )
                        ],
                      ),
                    )
                ),
              ),
              Positioned.fill(
                  top: size.height / 8,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Image(image: AssetImage("assets/images/logo_white.png"), width: size.width / 4, fit: BoxFit.fill)
                  )
              ),
              // Positioned.fill(
              //     bottom: 30.0,
              //     child: Align(
              //         alignment: Alignment.bottomCenter,
              //         child: Container(
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text(
              //                   "Та бүртгэлгүй юу?",
              //                   style: TextStyle(
              //                     height: 1.0,
              //                     fontSize: size.width/25,
              //                     color: Colors.white,
              //                   ),
              //                 ),
              //                 TextButton(
              //                   child: Text(
              //                     "Бүртгүүлэх",
              //                     style: TextStyle(
              //                       height: 1.0,
              //                       fontSize: size.width/25,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.white,
              //                     ),
              //                   ),
              //                   onPressed: f_register,
              //                 )
              //               ],
              //             )
              //         )
              //     )
              // )
            ],
          )
      ),
    );
  }
}
