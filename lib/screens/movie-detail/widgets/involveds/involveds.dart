import 'package:cinephile_flutter/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

// Cf
import 'package:cinephile_flutter/utils/image.dart';
import 'package:cinephile_flutter/resources/images.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/involved-types.dart';
import 'package:cinephile_flutter/widgets/modal.dart';
import 'package:cinephile_flutter/widgets/touchable-opacity.dart';
import 'package:cinephile_flutter/screens/movie-detail/widgets/involveds/widgets/involved-modal.dart';

class InvolvedsWidget extends StatelessWidget {
  final List<dynamic> involveds;
  final String involvedType;

  InvolvedsWidget({@required this.involveds, @required this.involvedType});

  Widget _renderTitle({
    String title,
    int maxLines,
    double fontSize,
    FontWeight fontWeight,
    bool dontShow = false,
    double height,
  }) {
    if (dontShow) {
      return Container();
    }

    return Container(
      height: height,
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: CfColors.BLUE,
          fontWeight: fontWeight,
        ),
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  String _getInvolvedName({Map<String, dynamic> involved}) {
    if (involvedType == CfInvolvedTypes.CHARACTER) {
      return involved['character'];
    }

    if (involvedType == CfInvolvedTypes.PRODUCTION_TEAM) {
      return involved['job'];
    }

    return CfStrings.UNIFORMED;
  }

  void _handleInvolvedModalOpen({BuildContext context, int involvedId}) {
    CfModalWidget.showModal(
      context: context,
      content: InvolvedModalWidget(involvedId: involvedId),
    );
  }

  Widget _renderImagesProducer({int index}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Container(
        height: 60,
        width: 60,
        child: this.involveds[index]['logo_path'] != null
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: ImageUtils.getImageApi(
                    path: this.involveds[index]['logo_path']),
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              )
            : Image.asset(
                CfImages.notFound,
                fit: BoxFit.contain,
                height: 60,
                width: 60,
              ),
      ),
    );
  }

  Widget _renderOtherImagesProducer({int index}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10, top: 10),
      child: ClipOval(
        child: Container(
          height: 60,
          width: 60,
          child: this.involveds[index]['profile_path'] != null
              ? FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: ImageUtils.getImageApi(
                      path: this.involveds[index]['profile_path']),
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  CfImages.notFound,
                  fit: BoxFit.cover,
                  height: 60,
                  width: 60,
                ),
        ),
      ),
    );
  }

  Widget _renderImage({BuildContext context, int index}) {
    if (involvedType == CfInvolvedTypes.PRODUCER) {
      return _renderImagesProducer(index: index);
    }

    return _renderOtherImagesProducer(index: index);
  }

  Widget _renderItem({BuildContext context, int index}) {
    return CfTouchableOpacityWidget(
      activeOpacity: involvedType == CfInvolvedTypes.PRODUCER ? 1 : 0.5,
      onTap: () {
        if (involvedType == CfInvolvedTypes.PRODUCER) {
          return false;
        }

        _handleInvolvedModalOpen(
            context: context, involvedId: this.involveds[index]['id']);
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        width: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _renderTitle(
                title: StringUtils.checkEmpty(
                  value: _getInvolvedName(involved: this.involveds[index]),
                  dontValue: CfStrings.UNIFORMED,
                ),
                maxLines: 1,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                dontShow: involvedType == CfInvolvedTypes.PRODUCER),
            _renderImage(context: context, index: index),
            _renderTitle(
              title: StringUtils.checkEmpty(
                value: this.involveds[index]['name'],
                dontValue: CfStrings.UNIFORMED,
              ),
              maxLines: 2,
              fontSize: 14,
              fontWeight: FontWeight.normal,
              height: 35,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (this.involveds.length == 0) {
      return Container(
        margin: EdgeInsets.only(bottom: 30, top: 10),
        padding: EdgeInsets.only(left: 15),
        child: Row(
          children: <Widget>[
            Text(
              CfStrings.UNIFORMED,
              style: TextStyle(fontSize: 14, color: CfColors.BLUE),
            ),
          ],
        ),
      );
    }

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Column(children: <Widget>[
        Container(
          width: double.infinity,
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 15),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _renderItem(
              context: context,
              index: index,
            ),
            itemCount: this.involveds.length,
          ),
        ),
      ]),
    );
  }
}
