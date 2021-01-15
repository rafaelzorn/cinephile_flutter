import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:cinephile_flutter/resources/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';

class MovieTrailerScreen extends StatefulWidget {
  // Route
  static const String route = '/movie-trailer';

  final String youtubeKey;

  MovieTrailerScreen({
    @required this.youtubeKey,
  });

  @override
  _MovieTrailerScreenState createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  // state
  bool isLoading = true;

  Widget _renderLoading() {
    if (isLoading) {
      return Container(
        color: CfColors.BLACK,
        child: Center(
          child: SizedBox(height: 40, width: 40, child: CfSpinnerWidget(color: CfColors.WHITE)),
        ),
      );
    }

    return Container();
  }

  Widget _renderContent() {
    return Stack(
      children: <Widget>[
        WebView(
          initialUrl:
              'https://www.youtube.com/embed/${widget.youtubeKey}?start=0',
          javascriptMode: JavascriptMode.unrestricted,
          onPageFinished: (finish) {
            setState(() {
              isLoading = false;
            });
          },
        ),
        _renderLoading()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(CfStrings.TRAILER),
      ),
      body: _renderContent(),
    );
  }
}
