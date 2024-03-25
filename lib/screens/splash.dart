import 'dart:async';
import 'package:flutter/material.dart';
import 'package:happy_food/util/images.dart';
import 'package:happy_food/screens/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 10), (){
     Navigator.of(context).pushReplacement(
       MaterialPageRoute(builder: (context) => Login())
     );
    });
  }
  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final heihg = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/start.jpg',
              fit: BoxFit.fitWidth,
              width: widht,
              height: heihg,
            ),
            Positioned(
              child: Image.asset(
                'assets/images/backGround.jpg',
                fit: BoxFit.fitWidth,
                width: widht,
                height: heihg,
                color: Color.fromRGBO(99, 220, 144, 0.8),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Positioned(
                    child: logoImage,
                  ),
                  const Text(

                    'HappyFood',
                    style: TextStyle(
                      fontFamily: 'IndieFlower',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold, // Жирный шрифт
                      fontStyle: FontStyle.italic, // Курсивный шрифт
                    ),
                  ),
                ])
              ],
            ),
          ],
        ),
      ),
    );
  }
}
