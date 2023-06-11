import 'package:banao_flutter/constants/images.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/styles.dart';

Widget top(context){
  return Container(
    height: MediaQuery.of(context).size.height*0.44,
    width: MediaQuery.of(context).size.width,
    color: blue2,
    child: Padding(
      padding: const EdgeInsets.only(left:16,right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:50,bottom: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Image(image: AssetImage(top1),width: 24),
                SizedBox(width: 260,),
                Padding(
                  padding: EdgeInsets.only(right:20),
                  child: Image(image: AssetImage(top2),width: 24,),
                ),
                Image(image: AssetImage(top3),width: 24,),
              ],
            ),
          ),
          const Text("Hello,Priya!",style: TextStyle(fontFamily: loram,fontSize:20,color: black1),),
          const Padding(
            padding: EdgeInsets.only(top:7),
            child: Text("What do you wanna learn today?",style: TextStyle(fontFamily: interm,color: grey1,fontSize: 16),),
          ),
          Padding(
            padding: const EdgeInsets.only(top:35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: blue1)
                    ),
                  height:MediaQuery.of(context).size.height*0.06,
                  width:MediaQuery.of(context).size.width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Row(
                      children: const [
                        Image(image: AssetImage(program),width: 15,),
                        SizedBox(width: 18,),
                        Text("Programs",style:TextStyle(fontSize: 14,fontFamily: intersb,color: blue1))
                      ],
                    ),
                  ),
                  ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: blue1),
                  ),
                  height:MediaQuery.of(context).size.height*0.06,
                  width:MediaQuery.of(context).size.width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Row(
                      children: const [
                        Image(image: AssetImage(get_help),width: 20,),
                        SizedBox(width: 18,),
                        Text("Get help",style:TextStyle(fontSize: 14,fontFamily: intersb,color: blue1))
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: blue1)
                  ),
                  height:MediaQuery.of(context).size.height*0.06,
                  width:MediaQuery.of(context).size.width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Row(
                      children: const [
                        Image(image: AssetImage(learn),width: 18,),
                        SizedBox(width: 18,),
                        Text("Learn",style:TextStyle(fontSize: 14,fontFamily: intersb,color: blue1))
                      ],
                    ),
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: blue1)
                  ),
                  height:MediaQuery.of(context).size.height*0.06,
                  width:MediaQuery.of(context).size.width*0.44,
                  child: Padding(
                    padding: const EdgeInsets.only(left:15),
                    child: Row(
                      children: const [
                        Image(image: AssetImage(tracker),width: 18,),
                        SizedBox(width: 18,),
                        Text("DD Tracker",style:TextStyle(fontSize: 14,fontFamily: intersb,color: blue1))
                      ],
                    ),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    ),

  );

}