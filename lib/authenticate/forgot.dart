import 'package:flutter/material.dart';
import 'login.dart';
import 'activition.dart';


class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const ForgotPasswordPageWidgets(title: 'Personal Assistant'),
    );
  }
}

class ForgotPasswordPageWidgets extends StatefulWidget {
  const ForgotPasswordPageWidgets ({super.key, required this.title});
  final String title;

  @override
  State<ForgotPasswordPageWidgets> createState() => _ForgotPasswordPageWidgetState();
}


class _ForgotPasswordPageWidgetState extends State<ForgotPasswordPageWidgets> {


  void _backToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage())
    );
  }

  void _continueActivition() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ActivitionPage())
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery .of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home_bg.jpg"),
              fit: BoxFit.cover
          ),
        ),
        child: Stack(
          children: [
            Positioned(
                width: size.width,
                height: size.height,
                child: Container(
                  color: const Color(0x1E319D).withOpacity(.8),
                  padding: const EdgeInsets.only(left: 50.0, right: 50),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [

                        Row(
                          children: [
                            Text(
                              "Нууц үг сэргээх",
                              style: TextStyle(
                                height: 1.0,
                                fontSize: size.width/25,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
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
                                  padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(top: 15, bottom: 15)),
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
                                onPressed: _continueActivition,
                              ),
                            )
                        ),
                      ]
                  ),
                )
            ),
            Positioned.fill(
                top: size.height / 8,
                child: Align(
                    alignment: Alignment.topCenter,
                    child: Image(image: AssetImage("assets/images/logo_white.png"), width: size.width / 4, fit: BoxFit.fill)
                )
            ),

            Positioned.fill(
                top: size.height / 10,
                left: size.width / 10,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: TextButton(
                      onPressed: _backToLogin,
                      child: Image(image: AssetImage("assets/images/arrow_left.png"), width: size.width / 10, fit: BoxFit.fill)
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}