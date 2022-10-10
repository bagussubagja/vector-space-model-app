import 'package:flutter/material.dart';
import 'package:vector_space_model/screen/about_us_screen.dart';
import 'package:vector_space_model/screen/home_screen.dart';

class BodyScreen extends StatefulWidget {
  BodyScreen({super.key});

  @override
  State<BodyScreen> createState() => _BodyScreenState();
}

class _BodyScreenState extends State<BodyScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePageScreen(),
    );
  }
}
