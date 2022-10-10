import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utils/colors.dart';

class AboutUsScreen extends StatelessWidget {
  AboutUsScreen({super.key});

  final List<String> _nameList = [
    "Alif Ilman Nafian",
    "Arfi Triawan",
    "Azzahra Ayu Vahendra",
    "Bagus Subagja",
    "Balqis Aqilah Syahira",
    "Iman Nurohman",
    "Septian Dwi Putra Pradipta",
    "Zulfa Nursyadiah"
  ];

  final List<String> _hoby = [
    "Hobi pegang kumis",
    "Hobi senyum",
    "Hobi nyimpen uang",
    "Hobi mengepal tangan",
    "Hobi ketawa",
    "Hobi nyelah motor",
    "Hobi memanjat",
    "Hobi bercerita"
  ];

  final List<int> _nimList = [
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
      body: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: AppColors.primaryLight,
              ),
              onPressed: () {
                Navigator.maybePop(context);
              },
            ),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 200,
          ),
          const SizedBox(
            height: 42,
          ),
          const Center(
              child: Text(
            'Kelompok 3',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          )),
          const SizedBox(
            height: 6,
          ),
          const Center(
              child: Text(
            'Vector Space Model',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          )),
          const SizedBox(
            height: 51,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: _nameList.length,
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  border: Border.all(
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade100,
                      offset: const Offset(3, 2),
                      spreadRadius: 2,
                      blurRadius: 15,
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    child: Text(
                      _nameList[index][0],
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                  onTap: () {},
                  title: Text(
                    _nameList[index],
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                  isThreeLine: true,
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      Text(
                        _hoby[index].toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        _nimList[index].toString(),
                        style: const TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          const SizedBox(
            height: 51,
          ),
        ],
      ),
    );
  }
}
