import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:provider/provider.dart';
import 'package:skeletons/skeletons.dart';
import 'package:vector_space_model/core/data_provider.dart';
import 'package:vector_space_model/utils/colors.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        title: Image.asset(
          'assets/images/logo.png',
          height: 35,
          width: 35,
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Consumer<DataProvider>(
        builder: (context, dataProvider, _) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            primary: true,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(
                height: 37,
              ),
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
                  initialValue: dataProvider.query,
                  textInputAction: TextInputAction.search,
                  onFieldSubmitted: (val) {
                    dataProvider.getData(query: val);
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
                height: 37,
              ),
              dataProvider.isLoading
                  ? ListView.separated(
                      itemCount: 3,
                      physics: const ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 1,
                                color: const Color(0xFF6D6B6B),
                              )),
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SkeletonLine(
                                style: SkeletonLineStyle(
                                  width: 100,
                                  height: 20,
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              SkeletonParagraph(
                                style: SkeletonParagraphStyle(
                                  lines: 4,
                                  padding: EdgeInsets.zero,
                                  lineStyle: SkeletonLineStyle(
                                    borderRadius: BorderRadius.circular(16),
                                    randomLength: true,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          height: 16,
                        );
                      },
                    )
                  : (dataProvider.data.isNotEmpty)
                      ? ListView.separated(
                          itemCount: dataProvider.data.length,
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            final doc = dataProvider.data[index];
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    width: 1,
                                    color: const Color(0xFF6D6B6B),
                                  )),
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Doc${doc.documentId + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  TextHighlight(
                                    text: doc.corpus,
                                    words: { for (var v in dataProvider.query.split(" ")) v: HighlightedWord(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                    ) },
                                    textStyle: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.primaryLight,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.star_rounded,
                                        color: Colors.yellow,
                                        size: 25,
                                      ),
                                      const SizedBox(width: 9),
                                      Text(
                                        "${doc.scores}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(
                              height: 16,
                            );
                          },
                        )
                      : Column(
                          children: const [
                            SizedBox(height: 240),
                            Text(
                              'Opps.. !!',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 32,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Query tidak ditemukan pada korpus",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
              const SizedBox(
                height: 37,
              ),
            ],
          );
        },
      ),
    );
  }
}
