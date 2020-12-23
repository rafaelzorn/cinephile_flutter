import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class CfBottomNavigationBar extends StatelessWidget {
  final Function handleIndexStack;
  final int currentIndex;

  CfBottomNavigationBar({
    @required this.handleIndexStack,
    @required this.currentIndex,
  });

  _renderBottomNavigationBarItem({IconData icon, String title}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: title,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: CfColors.BLUE,
          ),
        ],
      ),
      child: BottomNavigationBar(
        selectedItemColor: CfColors.PINK,
        backgroundColor: CfColors.WHITE,
        unselectedItemColor: CfColors.BLUE,
        iconSize: 26,
        selectedFontSize: 12,
        elevation: 0,
        currentIndex: currentIndex,
        onTap: (index) {
          this.handleIndexStack(index);
        },
        items: [
          _renderBottomNavigationBarItem(icon: Icons.home, title: CfStrings.HOME),
          _renderBottomNavigationBarItem(icon: Icons.search, title: CfStrings.SEARCH),
          _renderBottomNavigationBarItem(icon: Icons.menu, title: CfStrings.MORE),
        ],
      ),
    );
  }
}
