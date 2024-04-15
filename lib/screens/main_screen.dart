
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../product.dart';
import '../util/сolors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  bool _isGalleryVisible = false;
  bool _isObscured = false;

  final List<Product> product = [
    Product(
        name: 'Bound Salad',
        descritions: 'Avocado, corn, pepperjack, crispy shallots, romaine',
        discount: 0.0,
        price: 28.0,
        image: 'assets/images/bound_salad.png'),
    Product(
        name: 'Favourite pizza',
        descritions: '',
        discount: 50.0,
        price: 22.0,
        image: 'assets/images/salat_no_name.png'),
    Product(
        name: 'Jack burger',
        descritions: '',
        discount: 50.0,
        price: 10.0,
        image: 'assets/images/burder.png'),
    Product(
        name: 'Nicoise Salad',
        descritions: '',
        discount: 50.0,
        price: 10.0,
        image: 'assets/images/nicoise_salad.png'),
  ];


  final List<String> images = [
    'assets/images/hamburger_button.png',
    'assets/images/salad_button.png',
    'assets/images/pizza_button.png'
  ];
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(_controller);
  }

  void toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured; // Переключаем состояние
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            _search(),
            const SizedBox(height: 3),
            Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isGalleryVisible = !_isGalleryVisible;
                          if (_isGalleryVisible) {
                            _controller.forward();
                          } else {
                            _controller.reverse();
                          }
                        });
                      },
                      child: Image.asset(
                        'assets/images/menu_group.png',
                        width: 77,
                        height: 77,
                        fit: BoxFit.cover,
                      ),

                      // ],
                    ),
                    _showImageGallery()
                  ],
                )),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Special offer',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Montserrat'),
                  ),
                  const SizedBox(width: 140),
                  IconButton(
                      icon: const Icon(
                        size: 50,
                        Icons.chevron_right_outlined,
                        color: Colors.green,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
             Expanded(
               child: ListView.builder(
                   itemCount: product.length,
                   itemBuilder: (context, index) {
                     Product productItem = product[index];
                     return Stack(
                       children: [
                         Text(productItem.name),
                          Container(
                             padding: const EdgeInsets.only(top: 10),
                             width: 213,
                             height: 135,
                             decoration: const BoxDecoration(
                               borderRadius: BorderRadius.only(topRight: Radius.circular(120), bottomRight: Radius.circular(120)),
                                 gradient: colorDiscount
                             ),
                           ),
                       ],
                     );
                   }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: false,
        showUnselectedLabels: true,
        onTap: _onItemTupped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: navigationInemColor,
                size: 30,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border,
                  color: navigationInemColor, size: 30),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined,
                  color: navigationInemColor, size: 30),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined,
                  color: navigationInemColor, size: 30),
              label: '')
        ],
      ),
    );
  }

  Widget _card() {
    final List<Product> filteredProducts = product.where((product) => product.discount > 0).toList();
    return ListView.builder(
        itemCount: product.length,
        itemBuilder: (context, index) {
          Product productItem = product[index];
          Stack(
            children: [
              Text(productItem.name),
              Card(
                child: Container(
                  width: 213,
                  height: 135,
                  decoration: const BoxDecoration(
                    gradient: colorDiscount
                  ),
                ),
              ),
            ],
          );
        });
  }

  Widget _search() {
    return Container(
      width: 350,
      height: 56,
      decoration: BoxDecoration(
        color: searchBackgroundColor,
        borderRadius: BorderRadius.circular(28.0),
      ),
      child: const TextField(
        decoration: InputDecoration(
          suffixIcon: Padding(
            padding: EdgeInsets.all(15.0),
            child: Icon(
              Icons.search,
              size: 25,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  Widget _showImageGallery() {
    return Row(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _isGalleryVisible ? MediaQuery.of(context).size.width : 0,
          height: 100,
          color: Colors.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  images[index],
                  width: 77,
                  height: 77,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _onItemTupped(int index) {
    setState(() {});
  }
}
