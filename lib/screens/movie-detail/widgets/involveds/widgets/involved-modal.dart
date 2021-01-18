import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

// Cf
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/services/navigation.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cinephile_flutter/utils/image.dart';
import 'package:cinephile_flutter/resources/images.dart';
import 'package:cinephile_flutter/services/api.dart';
import 'package:cinephile_flutter/models/involved.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';
import 'package:cinephile_flutter/widgets/notification.dart';
import 'package:cinephile_flutter/utils/date.dart';

class InvolvedModalWidget extends StatefulWidget {
  final int involvedId;

  InvolvedModalWidget({@required this.involvedId});

  @override
  _InvolvedModalWidgetState createState() => _InvolvedModalWidgetState();
}

class _InvolvedModalWidgetState extends State<InvolvedModalWidget> {
  static final _api = ApiService.getInstance();

  // state
  bool isLoading = false;
  bool isError = false;
  InvolvedModel involvedDetail;

  @override
  void initState() {
    super.initState();

    _getInvolved();
  }

  Future<void> _getInvolved() async {
    setState(() {
      isLoading = true;
    });

    try {
      Response response = await _api.get('person/${widget.involvedId}');

      final Map<String, dynamic> involvedFromApi =
          JsonDecoder().convert(response.toString());

      final InvolvedModel involved =
          InvolvedModel.fromJson(jsonMap: involvedFromApi);

      setState(() {
        isLoading = false;
        isError = false;
        involvedDetail = involved;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
        isError = true;
      });
    }
  }

  Widget _renderButtonClose() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.only(right: 60, left: 60),
            child: FlatButton(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              onPressed: () => NavigationService().goBack(),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 20,
                color: CfColors.DARK_BLUE,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(color: CfColors.DARK_BLUE),
              ),
              color: CfColors.WHITE,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _renderImage() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: involvedDetail.profilePath != null
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: ImageUtils.getImageApi(path: involvedDetail.profilePath),
                height: 175,
                width: 115,
                fit: BoxFit.cover,
              )
            : Image.asset(
                CfImages.notFound,
                fit: BoxFit.cover,
                height: 175,
                width: 115,
              ),
      ),
    );
  }

  Widget _renderInvolvedName({String name}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        name,
        maxLines: 2,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
          color: CfColors.DARK_BLUE,
        ),
      ),
    );
  }

  Widget _renderInvolvedInformation({String information}) {
    return Container(
      margin: EdgeInsets.only(bottom: 7),
      child: Text(
        information,
        maxLines: 2,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 16, color: CfColors.BLUE),
      ),
    );
  }

  Widget _renderMainInformation() {
    return Container(
      child: Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _renderInvolvedName(name: involvedDetail.name),
            _renderInvolvedInformation(
              information: involvedDetail.knownForDepartment,
            ),
            _renderInvolvedInformation(
              information: DateUtils.getAge(birthday: involvedDetail.birthday),
            ),
            _renderInvolvedInformation(information: involvedDetail.placeOfBirth)
          ],
        ),
      ),
    );
  }

  Widget _renderBiography() {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 7),
                child: Text(
                  CfStrings.BIOGRAPHY,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: CfColors.DARK_BLUE,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  involvedDetail.biography,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 16,
                    color: CfColors.BLUE,
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderInformations() {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_renderImage(), _renderMainInformation()],
            ),
          ),
          _renderBiography(),
        ],
      ),
    );
  }

  Widget _renderContent() {
    if (isLoading) {
      return Center(
        child: SizedBox(height: 40, width: 40, child: CfSpinnerWidget()),
      );
    }

    if (isError) {
      return CfNotificationWidget(
        icon: Icons.report_problem,
        text: CfStrings.SOMETHING_WRONG_HAS_HAPPENED,
        textButton: CfStrings.TRY_AGAIN,
        onPress: _getInvolved,
      );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: SingleChildScrollView(child: _renderInformations()),
        ),
        _renderButtonClose(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(22, 22, 22, 0),
      height: (MediaQuery.of(context).size.height * 0.7),
      child: _renderContent(),
    );
  }
}
