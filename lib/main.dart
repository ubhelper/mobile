import 'package:flutter/material.dart';
import 'authenticate/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Assistant',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Personal Assistant'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage())
    );
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                child: Center(
                    child: Stack(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage("assets/images/logo_white.png"), width: size.width / 5, fit: BoxFit.fill ),
                            Text(
                              'Бие биедээ туслаад мөнгө\nолоорой',
                              style: TextStyle(fontSize: size.width / 20, color: Colors.white, fontWeight: FontWeight.w500, height: 1),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        Positioned.fill(
                            bottom: 100.0,
                            child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    decoration: BoxDecoration(
                                      // color: const Color(0x3B4381),
                                        color: Color.fromRGBO(59, 67, 129, 1),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(50.0),
                                        ),
                                        boxShadow: [
                                          BoxShadow(color: Color.fromRGBO(255, 255, 255, .55),
                                              spreadRadius: 3,
                                              blurRadius: 6,
                                              offset: Offset(0, 1))
                                        ]
                                    ),
                                    child: ElevatedButton(
                                      onPressed: _incrementCounter,
                                      child: Image(
                                        image: AssetImage("assets/images/arrow_right.png"),
                                        width: size.width/20,
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        shape: CircleBorder(),
                                        padding: EdgeInsets.all(22),
                                        backgroundColor: const Color(0x3B4381),
                                      ),
                                    )
                                )
                            )
                        )
                      ],
                    )
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}
