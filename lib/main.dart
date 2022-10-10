import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_space_model/provider/provider_list.dart';
import 'package:vector_space_model/provider/theme_provider.dart';
import 'package:vector_space_model/screen/body_screen.dart';
import 'package:vector_space_model/screen/home_screen.dart';

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
    return MaterialApp(
      title: 'Vector Space Model',
      theme: provider.theme,
      home: BodyScreen(),
    );
  }
}
