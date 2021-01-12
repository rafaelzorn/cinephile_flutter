import 'package:flutter/material.dart';

// Cf
import 'package:cinephile_flutter/resources/strings.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:cinephile_flutter/widgets/spinner.dart';

class MovieTrailerScreen extends StatefulWidget {
  // Route
  static const String route = '/movie-trailer';

  final Map arguments;

  MovieTrailerScreen({
    this.arguments = const {'key': null},
  });

  @override
  _MovieTrailerScreenState createState() => _MovieTrailerScreenState();
}

class _MovieTrailerScreenState extends State<MovieTrailerScreen> {
  String argumentKey;

  // state
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    this.argumentKey = widget.arguments['key'];
  }

  Widget _renderLoading() {
    if (isLoading) {
      return Center(
        child: SizedBox(height: 40, width: 40, child: CfSpinnerWidget()),
      );
    }

    return Container();
  }

  Widget _renderContent() {
    return Stack(
      children: [
        WebView(
          initialUrl:
              'https://www.youtube.com/embed/${this.argumentKey}?start=0',
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
