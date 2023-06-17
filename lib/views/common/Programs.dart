import 'dart:convert';

import 'package:banao_flutter/constants/images.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists.dart';
import '../../constants/styles.dart';
import 'package:http/http.dart' as http;

import '../../models/Programs_model.dart';

List<ProgramModel>programLists=[];

Widget programs(BuildContext context){
    return FutureBuilder(
      future: fetchPrograms(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            height: MediaQuery.of(context).size.height * 0.42,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text(
                        "Programs for you",
                        style: TextStyle(
                          fontFamily: 'loram',
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        width: 140,
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.black12),
                          ),
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(image: const AssetImage(lifetstyle1),height: MediaQuery.of(context).size.height*0.179,
                                width: MediaQuery.of(context).size.width,),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 15, right: 10, left: 10, bottom: 10),
                                child: Text(programLists[index].category,
                                  style: const TextStyle(
                                      fontSize: 16, fontFamily: interb, color: blue1),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10, right: 10, bottom: 20),
                                child: Text(programLists[index].name,
                                  style: const TextStyle(
                                      fontFamily: interb, fontSize: 16, color: Colors.black),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment : Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10,bottom:15),
                                    child: Row(
                                      children: [
                                        Text("${programLists[index].lesson} lessons",
                                          style: const TextStyle(
                                              fontSize: 12, fontFamily: interm, color: grey1),textAlign: TextAlign.justify,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: 10,
                        );
                      },
                      itemCount: programLists.length,
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

Future<List<ProgramModel>> fetchPrograms() async {
  final response = await http.get(Uri.parse('https://632017e19f82827dcf24a655.mockapi.io/api/programs'));
  var data = jsonDecode(response.body);
  if (response.statusCode == 200) {
    programLists=ProgramModel.programsFromSnapshot(data['items']);
    // print(programLists.length);
    return programLists;
  } else {
    throw Exception('Failed to fetch programs');
  }
}




