import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../util/сolors.dart';
import 'main_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isObscured = true;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }
  void toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured; // Переключаем состояние
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topRight,
            fit: BoxFit.fill,
            image: AssetImage('assets/images/bg.png'),
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text(
                'Log in',
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 20),
              // Пространство между текстом и изображением
              Image.asset('assets/images/orange_juice_shadow.png',
                  fit: BoxFit.cover),
              const SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Email Addres',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  _inputLogin(),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  _inputPassword(),
                  const SizedBox(height: 15),
                  const Text(
                    'Forgot password?',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.green),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.yellow),
                  padding: MaterialStateProperty.all(const EdgeInsets.only(top: 16, left: 135, bottom: 16, right: 135)),
                  minimumSize:
                      MaterialStateProperty.all<Size>(const Size(329, 59)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(66.0)
                  )),
                  elevation: MaterialStateProperty.all(12),
                  shadowColor: MaterialStateProperty.all(shadowButtonColor)
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const MainScreen()), (route) => false);
                },
                child: const Text(
                  'Skip now',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputLogin() {
    return Material(
      shadowColor: Colors.black,
      child: Container(
        width: 329, // Указываем ширину Container
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // смещение тени вниз
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: 20), // Задаем внутренние отступы
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(28.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputPassword() {
    return Material(
      shadowColor: Colors.black,
      child: Container(
        width: 329, // Указываем ширину Container
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(28.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 3), // смещение тени вниз
            ),
          ],
        ),
        child: TextField(
          decoration: InputDecoration(
            iconColor: Colors.black,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            // Задаем внутренние отступы
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, style: BorderStyle.none),
              borderRadius: BorderRadius.circular(28.0),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GestureDetector(
                onTap: toggleVisibility,
                child:
                    Icon(_isObscured ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              minHeight: 24, // Минимальная высота для центрирования
              minWidth: 24, // Минимальная ширина для центрирования
            ),
          ),
          obscureText: _isObscured, // Используем состояние для скрытия текста
        ),
      ),
    );
  }
}
