import 'package:flutter/material.dart';
import 'package:vector_space_model/screen/about_us_screen.dart';
import 'package:vector_space_model/screen/home_screen.dart';

class BodyScreen extends StatefulWidget {
  BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {
  List<Widget> _body = [const HomePageScreen(), AboutUsScreen()];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "About Us"),
          ]),
    );
  }
}
