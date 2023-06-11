import 'package:flutter/material.dart';

import 'views/common/Events.dart';
import 'views/common/Lessons.dart';
import 'views/common/Programs.dart';
import 'views/common/navbar.dart';
import 'views/common/top_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  _HomeState createState() =>_HomeState();
}

class _HomeState extends State<MyHomePage>{
  int _currentIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child:Column(
          children: [
            top(context),
            programs(context),
            events(context),
            lessons(context)
          ],
        )
      ),
      bottomNavigationBar: NavBar(),

    );

  }

}

