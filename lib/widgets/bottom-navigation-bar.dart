import 'package:flutter/material.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/strings.dart';

class CfBottomNavigationBar extends StatelessWidget {
  final Function handleChangeTab;
  final int currentIndex;

  CfBottomNavigationBar(
      {@required this.handleChangeTab, @required this.currentIndex});

  Widget _renderTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 11, letterSpacing: .1),
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
          this.handleChangeTab(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: _renderTitle(CfStrings.HOME),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: _renderTitle(CfStrings.SEARCH),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            title: _renderTitle(CfStrings.MORE),
          ),
        ],
      ),
    );
  }
}
