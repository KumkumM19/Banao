import 'package:banao_flutter/constants/images.dart';
import 'package:banao_flutter/models/Lessons_model.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists.dart';
import '../../constants/styles.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

List<LessonModel> lessonLists = [];

Widget lessons(BuildContext context) {
  return FutureBuilder(
    future: fetchLessons(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  children: const [
                    Text("Lessons for you",
                      style: TextStyle(
                        fontFamily: 'loram',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),
                    Text(
                      "View all",
                      style: TextStyle(
                        fontFamily: 'interm',
                        fontSize: 12,
                        color: grey1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.arrow_forward,
                        color: grey1,
                        size: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // Add a SizedBox to separate the Row and ListView
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.38,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(width: 1, color: Colors.black12)),
                          // height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: const AssetImage(babycare),
                                height:
                                    MediaQuery.of(context).size.height * 0.18,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 10, left: 10, bottom: 10),
                                child: Text(
                                  lessonLists[index].category,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: interb,
                                      color: blue1),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 20),
                                child: Text(
                                  lessonLists[index].name,
                                  style: const TextStyle(
                                      fontFamily: interb,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(left: 10, right: 10,bottom: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${lessonLists[index].duration} min",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: interm,
                                              color: grey1),
                                        ),
                                        const Icon(
                                          Icons.shopping_bag_outlined,
                                          color: grey1,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ));
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: lessonLists.length,
                  ),
                ),
              ],
            ),
          ),
        );
      }
    },
  );
}

Future<List<LessonModel>> fetchLessons() async {
  final response = await http.get(
      Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/lessons'));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    lessonLists = LessonModel.lessonsFromSnapshot(data['items']);
    return lessonLists;
  } else {
    throw Exception('Failed to fetch programs');
  }
}
