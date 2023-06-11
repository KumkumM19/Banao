import 'package:banao_flutter/constants/images.dart';
import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      iconSize: 23,
      selectedFontSize: 12,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: blue1,
      selectedIconTheme: const IconThemeData(color: blue1),
      unselectedItemColor: grey1,
      backgroundColor:Colors.white ,
      items: const [
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(homegrey),width: 16,),
          label: "Home",
          backgroundColor: grey1,
          activeIcon: Image(image: AssetImage(home),width: 16,),
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(learng),width: 20),
          label: "Learn",
          backgroundColor: grey1,
          activeIcon: Image(image: AssetImage(learnb),width: 20,)
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(hub),width: 18,),
          label: "Hub",
          backgroundColor: grey1,
          activeIcon: Image(image: AssetImage(hubb),width: 18,)
        ),
        BottomNavigationBarItem(
          icon: Image(image: AssetImage(chat),width: 20,),
          label: "Chat",
          backgroundColor: grey1,
            activeIcon: Image(image: AssetImage(chatb),width: 20,)
        ),BottomNavigationBarItem(
          icon: Image(image: AssetImage(profile),width: 25,),
          label: "Profile",
          backgroundColor: grey1,
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
    );
  }
}
