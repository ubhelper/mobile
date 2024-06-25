import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:textfield_shadow/custom_textfield.dart';


class ActivitionPage extends StatelessWidget {
  const ActivitionPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ActivitionPageWidgets(title: 'Personal Assistant'),
    );
  }
}

class ActivitionPageWidgets extends StatefulWidget {
  const ActivitionPageWidgets ({super.key, required this.title});
  final String title;

  @override
  State<ActivitionPageWidgets> createState() => _ActivitionPageWidgetsState();
}

class _ActivitionPageWidgetsState extends State<ActivitionPageWidgets> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery .of(context).size;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [

            Positioned(
                width: size.width,
                height: size.height,
                child: Container(
                  color: const Color(0xFFFFFF).withOpacity(1),
                  padding: const EdgeInsets.only(left: 50.0, right: 50),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Баталгаажуулах кодоо оруулна уу.",
                                style: TextStyle(
                                  height: 1.0,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color.fromRGBO(59, 67, 129, 1),
                                ),
                              ),
                              SizedBox(height: 30),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget> [
                                    Container(
                                      width: size.width / 7,
                                      decoration: BoxDecoration(
                                        // color: const Color(0x3B4381),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, .3),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(2, 3))
                                          ]
                                      ),
                                      child: TextField(
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(left: 28.0, right: 20, bottom: 20, top: 20),
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
                                    SizedBox(width: 10),
                                    Container(
                                      width: size.width / 7,
                                      decoration: BoxDecoration(
                                        // color: const Color(0x3B4381),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, .3),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(2, 3))
                                          ]
                                      ),
                                      child: TextField(
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(left: 28.0, right: 20, bottom: 20, top: 20),
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
                                    SizedBox(width: 10),
                                    Container(
                                      width: size.width / 7,
                                      decoration: BoxDecoration(
                                        // color: const Color(0x3B4381),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, .3),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(2, 3))
                                          ]
                                      ),
                                      child: TextField(
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(left: 28.0, right: 20, bottom: 20, top: 20),
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
                                    SizedBox(width: 10),
                                    Container(
                                      width: size.width / 7,
                                      decoration: BoxDecoration(
                                        // color: const Color(0x3B4381),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(15),
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(0, 0, 0, .3),
                                                spreadRadius: 1,
                                                blurRadius: 1,
                                                offset: Offset(2, 3))
                                          ]
                                      ),
                                      child: TextField(
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '',
                                          fillColor: Colors.white,
                                          filled: true,
                                          contentPadding: const EdgeInsets.only(left: 28.0, right: 20, bottom: 20, top: 20),
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
                                  ]
                              ),
                              SizedBox(height: 20),
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
                                            offset: Offset(4, 6))
                                      ]
                                  ),
                                  child: ButtonTheme(
                                    child: TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(top: 25, bottom: 25, left: 30, right: 30)),
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
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      onPressed: null,
                                    ),
                                  )
                              ),
                            ],
                          )
                      )
                  )
                )
            ),
            Positioned.fill(
                top: size.height / 8,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(image: AssetImage("assets/images/logo_white.png"), width: size.width / 4, fit: BoxFit.fill)
                )
            ),
          ],
        ),
      ),
    );
  }
}