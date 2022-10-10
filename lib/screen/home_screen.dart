import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_space_model/core/data_provider.dart';
import 'package:vector_space_model/provider/theme_provider.dart';
import 'package:vector_space_model/screen/about_us_screen.dart';
import 'package:vector_space_model/screen/result_screen.dart';
import 'package:vector_space_model/utils/colors.dart';
import 'package:touchable_opacity/touchable_opacity.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  String? query;
  final queryController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, _) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            children: [
              const SizedBox(height: 212),
              Image.asset(
                'assets/images/logo.png',
                width: 137,
                height: 137,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 32),
              const Center(
                child: Text(
                  'Vector Space Model',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.9),
                        offset: const Offset(0, 0),
                        blurRadius: 2),
                  ],
                ),
                child: TextFormField(
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (val) {
                   dataProvider.getData(query: val);
                   Navigator.push(context, MaterialPageRoute(builder: (_) => const ResultScreen()));
                  },
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: AppColors.primaryLight,
                      size: 25,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Color(0xFF403B3B),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              const Center(
                child: Text(
                  'Information Retrieval',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF747474),
                  ),
                ),
              ),
              const SizedBox(
                height: 21,
              ),
              Center(
                child: TouchableOpacity(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => AboutUsScreen()));
                  },
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(text: '❤️ ',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        TextSpan(
                          text: 'Kelompok 3',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF747474),
                            decoration: TextDecoration.underline,
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
