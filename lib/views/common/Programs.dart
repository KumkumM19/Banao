import 'package:banao_flutter/constants/images.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/lists.dart';
import '../../constants/styles.dart';

Widget programs(BuildContext context) {
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
          SizedBox(height: 10), // Add a SizedBox to separate the Row and ListView
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 1,
                      color: Colors.black12
                    )
                  ),
                  // height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 0.6,
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(image: AssetImage(list1[index]),height: MediaQuery.of(context).size.height*0.179,
                        width: MediaQuery.of(context).size.width,),
                      Padding(
                        padding: const EdgeInsets.only(top:15,right:10,left:10,bottom:10),
                        child: Text(list1title[index],style: TextStyle(fontSize: 16,fontFamily: interb,color: blue1),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10,right:10,bottom: 20),
                        child: Text(list1b[index],style: TextStyle(fontFamily: interb,fontSize: 16,color: Colors.black),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:10,right:10),
                        child: Text(list1c[index],style: TextStyle(fontSize: 12,fontFamily: interm,color: grey1),),
                      )

                    ],
                  )
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 10,
                );
              },
              itemCount: 2,
            ),
          ),
        ],
      ),
    ),
  );
}
