import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:vector_space_model/core/data_class.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});
  List<String> _nameList = [
    "Alif Ilman Nafian",
    "Arfi Triawan",
    "Azzahra Ayu Vahendra",
    "Bagus Subagja",
    "Balqis Aqilah Syahira",
    "Iman Nurohman",
    "Septian Dwi Putra Pradipta",
    "Zulfa Nursyadiah"
  ];

  List<int> _nimList = [
    2009431,
    2002890,
    2004717,
    2008315,
    2001982,
    2005086,
    2007428,
    2009156
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
      ),
      body: ListView.builder(
        itemCount: _nameList.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {},
            title: Text(_nameList[index]),
            subtitle: Text(_nimList[index].toString()),
          );
        },
      ),
    );
  }
}
