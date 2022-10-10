import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:vector_space_model/provider/provider_list.dart';
import 'package:vector_space_model/provider/theme_provider.dart';
import 'package:vector_space_model/screen/body_screen.dart';

import 'screen/splash_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ProviderList.providers,
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<Themeprovider>(context, listen: true);
    return SkeletonTheme(
      shimmerGradient: const LinearGradient(
        colors: [
          Color(0xFFF1F1F1),
          Color(0xFFF5F5F5),
          Color(0xFFF0F0F0),
        ],
        stops: [
          0.1,
          0.5,
          0.9,
        ],
      ),
      darkShimmerGradient: const LinearGradient(
        colors: [
          Color(0xFF222222),
          Color(0xFF242424),
          Color(0xFF2B2B2B),
          Color(0xFF242424),
          Color(0xFF222222),
        ],
        stops: [
          0.0,
          0.2,
          0.5,
          0.8,
          1,
        ],
        begin: Alignment(-2.4, -0.2),
        end: Alignment(2.4, 0.2),
        tileMode: TileMode.clamp,
      ),
      child: MaterialApp(
        title: 'Vector Space Model',
        theme: provider.theme,
        home: SplashScreen(),
      ),
    );
  }
}
