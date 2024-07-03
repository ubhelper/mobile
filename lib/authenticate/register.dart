import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import './login.dart';

class RegisterApp extends StatelessWidget {
  const RegisterApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RegisterPage(title: 'Personal Assistant'),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.title});
  final String title;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

String v_register_first = 'А';
bool isDropDownOpen = false;

class _RegisterPageState extends State<RegisterPage> {

  String v_gender = 'Эрэгтэй';
  String v_register_first = 'А';
  String v_register_second = 'Б';
  int v_selected = 0;

  var validation = {
    'lastname'        : false,
    'firstname'       : false,
    'register'        : false,
    'phone'           : false,
    'email'           : false,
    'password'        : false,
    'repassword'      : false
  };

  void _onSubmit() async {

    // print(!RegExp('(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|.(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))').hasMatch(_emailController.text));
    setState(() {
      validation['lastname'] = _lastnameController.text.isEmpty;
      validation['firstname'] = _nameController.text.isEmpty;
      validation['register'] = _registerController.text.isEmpty || _registerController.text.length < 8;
      validation['phone'] = _phoneController.text.isEmpty;
      validation['email'] = _emailController.text.isEmpty;
      validation['password'] = _passwordController.text.isEmpty;
      validation['repassword'] = _repasswordController.text != _passwordController.text;
    });

    if (
      validation['lastname'] == true    ||
      validation['firstname'] == true   ||
      validation['register'] == true    ||
      validation['phone'] == true       ||
      validation['email'] == true       ||
      validation['password'] == true    ||
      validation['repassword'] == true
    ) {
      return;
    }

    final response = await http.post(
      Uri.parse(dotenv.env['APP_URL']! + '/v1/user/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name'      : _nameController.text,
        'last_name'       : _lastnameController.text,
        'phone'           : _phoneController.text,
        'email'           : _emailController.text,
        'register'        : v_register_first+v_register_second+_nameController.text,
        'gender'          : v_gender,
        'password'        : _passwordController.text,
        'role_id'         : '3'
      }),
    );


    if (response.statusCode != 200) {
      print(response);
      return;
    }

    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Бүртгүүлэх'),
        content: const Text('Хэрэглэгч амжилттай бүртгэгдлээ'),
        actions: <Widget>[
          TextButton(
            onPressed: () => {
              Navigator.pop(context, 'OK'),
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage())
              )
            },
            child: const Text('За, Ойлголоо'),
          ),
        ],
      ),
    );
  }
  //

  final _nameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _registerController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Positioned(
              width: size.width,
              height: size.height,
              child:Container(
                color: const Color(0xFFFFFF).withOpacity(.8),
                child: Container(
                  margin: const EdgeInsets.only(left: 30.0, right: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(image: AssetImage("assets/images/logo_blue.png"), width: size.width / 4, fit: BoxFit.fill),
                      SizedBox(height: 15),
                      Container(
                        // width: size.width / 7,
                        decoration: BoxDecoration(
                          // color: const Color(0x3B4381),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]
                        ),
                        child: TextField(
                          // style: TextStyle(fontSize: 20),
                          // keyboardType: TextInputType.number,
                          controller: _lastnameController,
                          onChanged: (String? value) {
                            setState(() {
                              validation['lastname'] = false;
                            });
                          },
                          decoration: InputDecoration(
                            errorText: validation['lastname']! ? 'Овог нэрээ оруулна уу' : null,
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: 'Овог',
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 28.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // width: size.width / 7,
                        decoration: BoxDecoration(
                          // color: const Color(0x3B4381),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]
                        ),
                        child: TextField(
                          // style: TextStyle(fontSize: 20),
                          // keyboardType: TextInputType.number,
                          controller: _nameController,
                          onChanged: (String? value) {
                            setState(() {
                              validation['firstname'] = false;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            errorText: validation['firstname']! ? 'Нэрээ оруулна уу': null,
                            fillColor: Colors.white,
                            hintText: 'Нэр',
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 28.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Row(
                          children: [
                            Container(
                                width: size.width / 50 * 7,
                                height: size.width / 50 * 7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, .2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        FocusScope.of(context).unfocus();
                                        isDropDownOpen = !isDropDownOpen;
                                        v_selected = 1;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        v_register_first,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                )
                            ),
                            SizedBox(width: size.width / 50),
                            Container(
                                width: size.width / 50 * 7,
                                height: size.width / 50 * 7,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, .2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]
                                ),
                                child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        FocusScope.of(context).unfocus();
                                        isDropDownOpen = !isDropDownOpen;
                                        v_selected = 2;
                                      });
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        v_register_second,
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    )
                                )
                            ),
                            SizedBox(width: size.width / 50),
                            Container(
                                width: size.width / 50 * 25.5,
                                height: size.width / 50 * 7,
                                decoration: BoxDecoration(
                                  // color: const Color(0x3B4381),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color.fromRGBO(0, 0, 0, .2),
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          offset: Offset(1, 1))
                                    ]
                                ),
                              child: TextField(
                                // style: TextStyle(fontSize: 20),
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(8)
                                ],
                                onChanged: (String? value) {
                                  setState(() {
                                    validation['register'] = false;
                                  });
                                },
                                keyboardType: TextInputType.number,
                                controller: _registerController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: '',
                                  errorText: validation['register']! ? 'Регистрийн дугаар буруу' : null,
                                  fillColor: Colors.white,
                                  filled: true,
                                  // contentPadding: const EdgeInsets.only(left: 28),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      borderSide: BorderSide.none
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // width: size.width / 7,
                        decoration: BoxDecoration(
                          // color: const Color(0x3B4381),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]
                        ),
                        child: TextField(
                          // style: TextStyle(fontSize: 20),
                          keyboardType: TextInputType.number,
                          controller: _phoneController,
                          onChanged: (String? value) {
                            setState(() {
                              validation['phone'] = false;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            errorText: validation['phone']! ? 'Утасны дугаар буруу' : null,
                            hintText: 'Утасны дугаар',
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 28.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // width: size.width / 7,
                        decoration: BoxDecoration(
                          // color: const Color(0x3B4381),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]
                        ),
                        child: TextField(
                          // style: TextStyle(fontSize: 20),
                          // keyboardType: TextInputType.number,
                          controller: _emailController,
                          onChanged: (String? value) {
                            setState(() {
                              validation['email'] = false;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            errorText: validation['email']! ? 'Имэйл буруу' : null,
                            hintText: 'Имэйл хаяг',
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 28.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, .2),
                                    spreadRadius: 2,
                                    blurRadius: 2,
                                    offset: Offset(1, 1))
                              ]
                          ),
                          child: DropdownButton<String>(
                            value: v_gender,
                            isExpanded: true,
                            onChanged: (String? value) {
                              setState(() {
                                v_gender = value!;
                              });
                            },
                            dropdownColor: Colors.white,
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Эрэгтэй',
                                child: Text('Эрэгтэй'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Эмэгтэй',
                                child: Text('Эмэгтэй'),
                              )
                            ],
                          )
                      ),
                      SizedBox(height: 10),
                      Container(
                        // width: size.width / 7,
                        decoration: BoxDecoration(
                          // color: const Color(0x3B4381),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]
                        ),
                        child: TextField(
                          // style: TextStyle(fontSize: 20),
                          // keyboardType: TextInputType.number,
                          controller: _passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          onChanged: (String? value) {
                            setState(() {
                              validation['password'] = false;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            hintText: 'Нууц үг',
                            errorText: validation['password']! ? 'Нууц үг оруулна уу': null,
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 28.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        // width: size.width / 7,
                        decoration: BoxDecoration(
                          // color: const Color(0x3B4381),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, .2),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(1, 1))
                            ]
                        ),
                        child: TextField(
                          // style: TextStyle(fontSize: 20),
                          // keyboardType: TextInputType.number,
                          controller: _repasswordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          onChanged: (String? value) {
                            setState(() {
                              validation['repassword'] = false;
                            });
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: Colors.white,
                            errorText: validation['repassword']! ? 'Нууц үг тохирохгүй байна' : null,
                            hintText: 'Нууц үг давтан',
                            filled: true,
                            contentPadding: const EdgeInsets.only(left: 28.0),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide.none
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
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
                              onPressed: _onSubmit,
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isDropDownOpen) _buildDropdownMenu(),
          ],
        ),
      ),
    );
  }

  List<String> items = [
    'А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'Ө', 'П', 'Р', 'С', 'Т', 'У', 'Ү', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я'
  ];


  Widget _buildDropdownMenu() {
    return Positioned.fill(
        bottom: 30.0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(top: 8.0),
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white
            ),
            child: GridView.count(
              crossAxisCount: 7,
              shrinkWrap: true,
              children: items.map((item) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (v_selected == 1) {
                        v_register_first = item;
                      }

                      if (v_selected == 2) {
                        v_register_second = item;
                      }
                      isDropDownOpen = false;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.all(2.0),
                    padding: EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Center(
                      child: Text(
                        item,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.0),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        )
    );
  }
}
