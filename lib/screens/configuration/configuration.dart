import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:share/share.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/widgets/switch.dart';
import 'package:cinephile_flutter/widgets/alert-dialog.dart';
import 'package:cinephile_flutter/store/mobx.dart';

class ConfigurationScreen extends StatefulWidget {
  // Route
  static const String route = '/configuration';

  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  final AsMobx _mobx = AsMobx();

  void _handleShare() {
    Share.share('${CfStrings.TITLE_SHARE_CONFIGURATION} \u{1F37F}');
  }

  void _handleRating() {
    CfAlertDialogWidget.alertDialog(
        context: context,
        title: CfStrings.ATTENTION,
        content: CfStrings.CONTENT_RATING_CONFIGURATION);
  }

  void _handleChangeAdultContent() {
    bool check = _mobx.configurationStore.hasAdultContent ? false : true;

    _mobx.configurationStore.setConfiguration(adultContent: check);
  }

  Widget _renderSectionTitle({String title}) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
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
      margin: EdgeInsets.only(bottom: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _renderSectionTitle(title: CfStrings.INTERFACE),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 25,
              horizontal: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(CfStrings.INCLUDE_ADULT_CONTENT,
                    style: TextStyle(
                      fontSize: 18,
                      color: CfColors.DARK_BLUE,
                    )),
                Observer(builder: (_) {
                  return CfSwitchWidget(
                      onChanged: _handleChangeAdultContent,
                      value: _mobx.configurationStore.hasAdultContent);
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderItemApplication({
    String title,
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
        children: <Widget>[
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
      children: <Widget>[
        _renderSectionTitle(title: CfStrings.APPLICATION),
        _renderItemApplication(
          title: CfStrings.TELL_A_FRIEND,
          onPress: _handleShare,
          icon: Icons.share,
        ),
        _renderItemApplication(
          title: CfStrings.RATE_THE_APP,
          onPress: _handleRating,
          icon: Icons.star_border,
        ),
        _renderItemApplication(
          title: '${CfStrings.VERSION} 0.0.1',
          hasBorder: false,
          colorText: CfColors.BLUE,
        ),
      ],
    );
  }

  Widget _renderContent() {
    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(15, 25, 15, 20),
      child: Column(
        children: <Widget>[
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
