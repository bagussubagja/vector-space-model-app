import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:vector_space_model/core/data_class.dart';

class ProviderList {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (_) => DataClass()
    )
  ];
}