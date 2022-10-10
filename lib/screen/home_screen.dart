import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vector_space_model/core/data_class.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider = Provider.of<DataClass>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DataClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vector Space Model'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: ListView(
            scrollDirection: Axis.vertical,
            primary: false,
            children: [
              TextFormField(
                controller: queryController,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (queryController.text != null) {
                    await provider.getData(query: queryController.text);
                    queryController.clear();
                  }
                },
                child: const Text('Search'),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 400,
                child: Scrollbar(
                  controller: _scrollController,
                  thumbVisibility: true,
                  child: ListView.builder(
                    itemCount: provider.data?.length ?? 0,
                    primary: false,
                    controller: _scrollController,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Hasil ${index + 1} :\n${provider.data?[index].corpus ?? '-'}'),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                              "Terdapat pada corpus : ${provider.data?[index].documentId}"),
                          const SizedBox(
                            height: 5,
                          ),
                          Text("Score : ${provider.data?[index].scores}"),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
