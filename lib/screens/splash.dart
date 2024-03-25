import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:happy_food/util/images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/images/start.jpg',
              fit: BoxFit.fill,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              child: Image.asset(
                'assets/images/backGround.jpg',
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color.fromRGBO(99, 220, 144, 0.8),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Positioned(
                    top: 350,
                    left: 50,
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
