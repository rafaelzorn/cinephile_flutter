import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/widgets/switch.dart';
import 'package:cinephile_flutter/widgets/alert-dialog.dart';

class ConfigurationScreen extends StatelessWidget {
  void _handleShare() {
    print('Share');
  }

  void _handleRating() {
    CfAlertDialogWidget();
  }

  void _handleChangeAdultContent() {}

  Widget _renderSectionTitle(String title) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 15,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: CfColors.DARK_BLUE,
        ),
      ),
    );
  }

  Widget _renderSectionInterface() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 40,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderSectionTitle(CfStrings.INTERFACE),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(CfStrings.INCLUDE_ADULT_CONTENT,
                    style: TextStyle(
                      fontSize: 18,
                      color: CfColors.DARK_BLUE,
                    )),
                CfSwitchWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderItemApplication(
    String title, {
    bool hasBorder = true,
    colorText = CfColors.DARK_BLUE,
    Function onPress,
    IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 25,
        horizontal: 0,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: hasBorder ? 1 : 0,
            color: hasBorder ? CfColors.LIGHT_GRAY : CfColors.TRANSPARENT,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18,
              color: colorText,
            ),
          ),
          onPress != null
              ? GestureDetector(
                  onTap: () {
                    onPress();
                  },
                  child: Icon(
                    icon,
                    size: 25,
                    color: CfColors.DARK_BLUE,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _renderSectionApplication() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _renderSectionTitle(CfStrings.APPLICATION),
        _renderItemApplication(
          CfStrings.TELL_A_FRIEND,
          onPress: _handleShare,
          icon: Icons.share,
        ),
        _renderItemApplication(
          CfStrings.RATE_THE_APP,
          onPress: _handleRating,
          icon: Icons.star_border,
        ),
        _renderItemApplication(
          '${CfStrings.VERSION} 0.0.1',
          hasBorder: false,
          colorText: CfColors.BLUE,
        ),
      ],
    );
  }

  Widget _renderContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
      child: Column(
        children: [
          _renderSectionInterface(),
          _renderSectionApplication(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.MORE),
      ),
      body: _renderContent(),
    );
  }
}
